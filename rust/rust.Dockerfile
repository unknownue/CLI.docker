
# -----------------------------------------------------------------------------------
FROM archlinux/base

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A Rust development environment with personal configuration in docker."
LABEL license="MIT"

# Copy files to image
COPY config/. config/
COPY system/. system/
COPY rust/. config/nvim/
RUN \
    cp -r config/. ~/.config/ && rm -r config/ && \
    cp -r system/. ~/ && rm -r system/

# Update base system and install rust
RUN pacman -Syy --noconfirm --noprogressbar && \
    pacman -S --noconfirm rust tar && \
    echo -e "Y\nY\n" | pacman -Scc

# Config neovim and vim-plug
RUN \ 
    # Install neovim and nodejs
    pacman -S neovim git nodejs --noconfirm --needed && \
    echo -e "Y\nY\n" | pacman -Scc && \
    # Install plugin for neovim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    nvim +slient +VimEnter +PlugInstall +qal && \
    nvim -c "CocInstall coc-rust-analyzer"

ENV USER=unknownue

CMD ["bash"]
# -----------------------------------------------------------------------------------
