
# -----------------------------------------------------------------------------------
FROM archlinux/base AS cpp-env

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A C++ development environment with personal configuration in docker."
LABEL license="MIT"

# Copy files to image
COPY config/. config/
COPY system/. system/
COPY cpp/. config/nvim/
RUN \
    cp -r config/. ~/.config/ && rm -r config/ && \
    cp -r system/. ~/ && rm -r system/

# Set mirror source for China
# RUN sed -i "1i Server = https://mirrors.163.com/archlinux/\$repo/os/\$arch" \
#    /etc/pacman.d/mirrorlist

# Update base system
RUN pacman -Syu --noconfirm --noprogressbar && \
    pacman-db-upgrade && \
    echo -e "Y\nY\n" | pacman -Scc

# Install C++ compiler
RUN pacman -S clang make cmake python --noconfirm --needed && \
    echo -e "Y\nY\n" | pacman -Scc

# Config neovim and vim-plug
RUN pacman -S neovim git python-pynvim --noconfirm --needed && \
    echo -e "Y\nY\n" | pacman -Scc && \
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    nvim +slient +VimEnter +PlugInstall +qal
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
FROM unknownue/cpp-env AS cpp-dev

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A C++ development environment with personal configuration in docker."
LABEL license="MIT"

# Config YouCompleteMe
# https://github.com/ycm-core/YouCompleteMe
RUN cd ~/.local/share/nvim/plugged/YouCompleteMe/ && \
    git submodule update --init --recursive && \
    python install.py --clang-completer && \
    cp ~/.local/share/nvim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py \
    ~/.config/nvim/.ycm_extra_conf.py

CMD ["bash"]
# -----------------------------------------------------------------------------------
