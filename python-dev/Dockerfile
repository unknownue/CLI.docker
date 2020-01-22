
FROM arch/base AS arch-python-dev

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A python development environment with personal configuration in docker."
LABEL python-version="3.7.x"
LABEL license="MIT"

WORKDIR /home/pydev-build

# Install python
# RUN git clone https://aur.archlinux.org/python37.git && \
#     chown -R unknownue python37/
# WORKDIR /home/pydev-build/python37/
# USER unknownue
# RUN gpg --recv-key 2D347EA6AA65421D && \
#     echo -e "unknownue" | makepkg -S -si --noconfirm
# USER root
# WORKDIR /root/pydev-build
# RUN rm -r python37/

# Install pip
# RUN wget https://bootstrap.pypa.io/get-pip.py && python3.7 get-pip.py && \
#     apt clean && \
#     ln -sf python3.7 /usr/bin/python && ln -sf pip3 /usr/bin/pip && \
#     pip3 install --upgrade pips && \
#     rm get-pip.py

RUN pacman -S gcc python python-pip python-setuptools --noconfirm && \
    echo -e "Y\nY" | pacman -Scc

# https://jdhao.github.io/2018/09/05/centos_nvim_install_use_guide/

COPY python-dev/. /home/pydev-build/nvim/
RUN pip install pynvim jedi yapf pylint --no-cache-dir && \
    mv /home/pydev-build/nvim/dev-plug.vim ~/.config/nvim/dev-plug.vim && \
    mv /home/pydev-build/nvim/dev-plug-config.vim ~/.config/nvim/dev-plug-config.vim && \ 
    mv /home/pydev-build/nvim/dev-plug-colemak.vim ~/.config/nvim/dev-plug-colemak.vim && \
    nvim +slient +VimEnter +PlugInstall +qall

WORKDIR  /root/dev/
RUN rm -r /home/pydev-build
