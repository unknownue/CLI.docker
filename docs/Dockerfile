
# -----------------------------------------------------------------------------------
FROM archlinux/base:latest

WORKDIR /root

ARG MIRROR_COUNTRY=CN

# Copy files to image ----------------------------------------------
ADD system/. /root/
ADD config/. /root/.config/

# Generate mirrorlist ----------------------------------------------
# Get the mirrorlist for a specific country
RUN curl -fLo /etc/pacman.d/mirrorlist \
    https://www.archlinux.org/mirrorlist/?country=${MIRROR_COUNTRY} && \
    sed -i 's/#Server/Server/' /etc/pacman.d/mirrorlist && \
    pacman -Syy
# Generate mirrorlist by testing speed
# RUN reflector --verbose -l 20 -p http --sort rate --save /etc/pacman.d/mirrorlist && \
#     pacman -Syy

# Add user --------------------------------------------------------
RUN useradd unknownue -m && \
    passwd -d unknownue && \
    # enable unknownue to sudo without password
    printf 'root ALL=(ALL) ALL\nunknownue ALL=(ALL) ALL\n' | tee -a /etc/sudoers

# Compiler --------------------------------------------------------
# RUN pacman -S --noconfirm sudo fakeroot git binutils && \
#     echo -e "Y\nY\n" | pacman -Scc

# Install common package ------------------------------------------
RUN pacman -S --noconfirm --noprogressbar \
    neofetch figlet git fzf ripgrep bat xclip && \
    echo -e "Y\nY\n" | pacman -Scc

# Configure file sync
ADD system/.ssh/. /root/.ssh/
RUN pacman -S --noconfirm --noprogressbar openssh rsync && \
    echo -e "Y\nY\n" | pacman -Scc && \
    git clone https://github.com/jacob-ogre/vim-syncr ~/.vim/bundle/vim-syncr && \
    # Use "ssh username@remote_address" to establish the remote host first
    chmod 600 ~/.ssh/id_rsa && \
    chmod 644 ~/.ssh/config

# Config Fish shell -----------------------------------------------
# RUN pacman -S fish --noconfirm --clean && \
#     echo -e "Y\nY\n" | pacman -Scc && \
#     curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish && \
#     curl -sLo ~/.local/bin/chips --create-dirs \
#     https://github.com/xtendo-org/chips/releases/download/1.1.2/chips_gnulinux && \
#     chmod +x ~/.local/bin/chips && \
#     ~/.local/bin/chips && \
#     cp -r /root/arch-build/config/fish/functions/. ~/.config/fish/functions/ && \
#     # Install fish plugin
#     fisher add jethrokuan/fzf

# Install Nerd Font -----------------------------------------------
# Use 'DroidSansMono Nerd Font Mono' for icon support
# RUN git clone https://aur.archlinux.org/nerd-fonts-hack.git && \
#     cd nerd-fonts-hack && sudo --user=builduser bash makepkg -si --noconfirm && \
#     cd .. && rm -r nerd-fonts-hack

# Config tmux -----------------------------------------------------
# https://github.com/tmux-plugins/tpm/issues/6
# RUN pacman -S tmux --noconfirm && \
#     echo -e "Y\nY\n" | pacman -Scc && \
#     git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
#     tmux start-server && \
#     tmux new-session -d && \
#     sleep 1 && \
#     bash ~/.tmux/plugins/tpm/scripts/install_plugins.sh && \
#     tmux kill-server

# Config neovim --------------------------------------------------
RUN pacman -S --noconfirm --noprogressbar neovim && \
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    nvim -c "PlugInstall" -c q -c q
# -----------------------------------------------------------------------------------
