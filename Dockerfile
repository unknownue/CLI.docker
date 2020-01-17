
FROM ubuntu:18.04 AS cli-base

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A command-line environment with personal configuration in docker."
LABEL python-version="3.7.x"
LABEL license="MIT"

WORKDIR /root/

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH "/root/usr/bin:${PATH}"

RUN apt update && apt upgrade -y && apt clean && \
    apt install -y --no-install-recommends git wget curl p7zip-full build-essential ca-certificates gettext

# Install Nerd Fonts
WORKDIR /root/.fonts/
RUN apt install -y --no-install-recommends fontconfig && \
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Ubuntu.zip && \
    7z x Ubuntu.zip && rm Ubuntu.zip && \
    fc-cache -fv

WORKDIR /root/dev

# Install Python 3.7 and corresponding pip
RUN apt install -y --no-install-recommends python3.7 python3-distutils
RUN wget https://bootstrap.pypa.io/get-pip.py && python3.7 get-pip.py && rm get-pip.py
RUN ln -sf python3.7 /usr/bin/python && ln -sf pip3 /usr/bin/pip

# Set system profile
COPY system/.bash_profile ~/.bash_profile

# Install Neovim
RUN apt install -y --no-install-recommends neovim python3-neovim && mkdir -p ~/.config/nvim/ && \
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY nvim/init.vim ~/.config/nvim/init.vim

# Install fish shell
COPY fish/plugin.yaml ~/.config/chips/plugin.yaml
COPY fish/config.fish ~/.config/fish/config.fish
RUN apt install -y --no-install-recommends fish && \
    curl -Lo ~/.local/bin/chips --create-dirs \
    https://github.com/xtendo-org/chips/releases/download/1.1.2/chips_gnulinux && \
    chmod +x ~/.local/bin/chips && ~/.local/bin/chips

# clean up
RUN apt autoremove -y && apt clean
    
CMD ["fish"]
