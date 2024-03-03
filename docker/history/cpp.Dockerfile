
# -----------------------------------------------------------------------------------
FROM unknownue/arch-env:latest

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A C++ development environment with personal configuration in docker."
LABEL license="MIT"

ENV USER=unknownue
ENV DISPLAY="host.docker.internal:0"
ENV ENV_DEV="cpp"


# Install C++ compiler
RUN pacman -S clang make cmake python --noconfirm --needed && \
    echo -e "Y\nY\n" | pacman -Scc

# Install neovim plugin for C++ development
RUN pacman -S python-pynvim --noconfirm --needed && \
    echo -e "Y\nY\n" | pacman -Scc && \
    nvim -c "PlugInstall" -c q -c q

# Config YouCompleteMe
# https://github.com/ycm-core/YouCompleteMe
RUN cd ~/.local/share/nvim/plugged/YouCompleteMe/ && \
    git submodule update --init --recursive && \
    python install.py --clang-completer

# Copied from https://jonasdevlieghere.com/a-better-youcompleteme-config/
ADD language/cpp/.ycm_extra_conf.py ~/.config/nvim/.ycm_extra_conf.py
# -----------------------------------------------------------------------------------

