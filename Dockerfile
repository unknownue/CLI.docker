
# -----------------------------------------------------------------------------------
FROM archlinux:20200106 AS arch-base

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A command-line environment with personal configuration in docker."
LABEL license="MIT"

WORKDIR /home/arch-build
RUN pacman -Syy && \
    pacman -S sudo binutils fakeroot git wget fish neovim tmux --noconfirm && \
    pacman -S fontconfig xorg-mkfontscale xorg-mkfontdir --noconfirm && \
    echo -e "Y\nY" | pacman -Scc

# Copy files to image
COPY config/ ./config/
COPY system/ ./system/
RUN cp -a config/ ~/.config/ && cp -a system/. ~/

# Add non-root user
RUN useradd unknownue && \
    echo -e "unknownue\nunknownue" | passwd unknownue && \
    usermod -a -G adm unknownue && \
    echo "unknownue ALL=(ALL)  ALL" > /etc/sudoers

# Install nerd font
RUN git clone https://aur.archlinux.org/nerd-fonts-hack.git && \
    mkdir /home/unknownue && \
    chown -R unknownue nerd-fonts-hack/ && \
    chown -R unknownue /home/unknownue/
WORKDIR /home/arch-build/nerd-fonts-hack/
USER unknownue
RUN echo -e "unknownue" | makepkg -S -si --noconfirm
USER root
WORKDIR /home/arch-build
RUN curl -Lo ~/.local/bin/chips --create-dirs \
    https://github.com/xtendo-org/chips/releases/download/1.1.2/chips_gnulinux && \
    chmod +x ~/.local/bin/chips && \
    ~/.local/bin/chips && \
    cp -r /home/arch-build/config/fish/functions/. ~/.config/fish/functions/  && \
    rm -r nerd-fonts-hack

# Config Fish shell
RUK curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# Config tmux
# https://github.com/tmux-plugins/tpm/issues/6
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
    tmux start-server && \
    tmux new-session -d && \
    sleep 1 && \
    bash ~/.tmux/plugins/tpm/scripts/install_plugins.sh && \
    tmux kill-server

# Config vimplug for neovim
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    cat ~/.config/nvim/plug-config.vim >> ~/.config/nvim/init.vim && \
    nvim +slient +VimEnter +PlugInstall +qall

WORKDIR /root/
RUN rm -r /home/arch-build

CMD ["fish"]
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
FROM arch-base AS arch-nvim
WORKDIR /root/dev
CMD ["nvim", "."]
# -----------------------------------------------------------------------------------
