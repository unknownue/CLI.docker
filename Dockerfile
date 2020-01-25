
# -----------------------------------------------------------------------------------
FROM greyltc/archlinux:2020-01-22 AS arch-base

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A command-line environment with personal configuration in docker."
LABEL license="MIT"

WORKDIR /root/arch-build
RUN pacman -Syy && \
    pacman -S binutils fakeroot --noconfirm --needed --clean && \
    echo -e "Y\nY" | pacman -Scc

# Copy files to image
COPY config/ ./config/
COPY system/ ./system/
RUN cp -a config/ ~/.config/ && cp -a system/. ~/

# Install yay
# From https://github.com/greyltc/docker-archlinux-aur
RUN curl https://github.com/greyltc/docker-archlinux-aur/raw/master/add-aur.sh --create-dirs -sLo /usr/sbin/add-aur && \
    chmod a+x /usr/sbin/add-aur && \
    add-aur docker

# Config Fish shell
RUN pacman -S fish --noconfirm --needed --clean && \
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish && \
    curl -sLo ~/.local/bin/chips --create-dirs \
    https://github.com/xtendo-org/chips/releases/download/1.1.2/chips_gnulinux && \
    chmod +x ~/.local/bin/chips && \
    ~/.local/bin/chips && \
    cp -r /root/arch-build/config/fish/functions/. ~/.config/fish/functions/

# Install nerd font
# RUN su docker -c 'yay -S --noprogressbar --needed --noconfirm nerd-fonts-hack'

# Config tmux
# https://github.com/tmux-plugins/tpm/issues/6
RUN pacman -S tmux --noconfirm --needed && \
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
    tmux start-server && \
    tmux new-session -d && \
    sleep 1 && \
    bash ~/.tmux/plugins/tpm/scripts/install_plugins.sh && \
    tmux kill-server

# Config neovim
RUN pacman -S neovim --noconfirm --needed && \
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    nvim +slient +VimEnter +PlugInstall +qall

WORKDIR /root/
RUN rm -r /root/arch-build

CMD ["fish"]
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
FROM arch-base AS arch-nvim
WORKDIR /root/dev
CMD ["nvim", "."]
# -----------------------------------------------------------------------------------
