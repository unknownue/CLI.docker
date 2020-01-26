
# -----------------------------------------------------------------------------------
FROM archlinux/base:20200106 AS install-env

# Copy files to image
COPY config/. ~/.config/
COPY system/. ~/

RUN \
    useradd builduser -m && \
    passwd -d builduser && \
    # enable builduser to sudo without password
    printf 'root ALL=(ALL) ALL\n' | tee -a /etc/sudoers && \
    pacman -Syy && \
    pacman -S --noconfirm sudo fakeroot git binutils && \
    echo -e "Y\nY" | pacman -Scc

# Change current root path to tmp directory path
WORKDIR /tmp

# Config Fish shell
# RUN pacman -S fish --noconfirm --needed --clean && \
#     curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish && \
#     curl -sLo ~/.local/bin/chips --create-dirs \
#     https://github.com/xtendo-org/chips/releases/download/1.1.2/chips_gnulinux && \
#     chmod +x ~/.local/bin/chips && \
#     ~/.local/bin/chips && \
#     cp -r /root/arch-build/config/fish/functions/. ~/.config/fish/functions/

# Install nerd font
# RUN su docker -c 'yay -S --noprogressbar --needed --noconfirm nerd-fonts-hack'

# Config tmux
# https://github.com/tmux-plugins/tpm/issues/6
# RUN pacman -S tmux --noconfirm --needed && \
#     git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
#     tmux start-server && \
#     tmux new-session -d && \
#     sleep 1 && \
#     bash ~/.tmux/plugins/tpm/scripts/install_plugins.sh && \
#     tmux kill-server
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
FROM install-env AS nvim-env
# Copy only the files we need from the previous stage
# COPY --from=install-env ["", ""]

# Config neovim
RUN pacman -S neovim --noconfirm --needed && \
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    nvim +slient +VimEnter +PlugInstall +qall && \
    echo -e "yes" | pacman -Scc
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
FROM nvim-env AS arch-nvim

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A dev environment with neovim installed and personal configuration in docker."
LABEL license="MIT"

CMD [ "nvim", "." ]
# -----------------------------------------------------------------------------------
