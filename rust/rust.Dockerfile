
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
    pacman -S --noconfirm rust gcc tar && \
    echo -e "Y\nY\n" | pacman -Scc

# Config neovim and vim-plug
RUN \
    # Install neovim and nodejs
    pacman -S neovim git yarn nodejs --noconfirm --needed && \
    echo -e "Y\nY\n" | pacman -Scc && \
    # Install plugin for neovim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    nvim -c "PlugInstall" -c q -c q

# Install rust-analyzer
RUN curl -fLo ~/.cargo/bin/ra_lsp_server --create-dirs \
    https://github.com/rust-analyzer/rust-analyzer/releases/download/2020-02-17/ra_lsp_server-linux && \
    chmod 777 ~/.cargo/bin/ra_lsp_server && \
    nvim -c "CocInstall coc-rust-analyzer" -c 5sleep -c q

ENV USER=unknownue

CMD ["bash"]
# -----------------------------------------------------------------------------------
