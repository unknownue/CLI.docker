
# -----------------------------------------------------------------------------------
FROM unknownue/arch-env:latest

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A Rust development environment with personal configuration in docker."
LABEL license="MIT"

ENV USER=unknownue
ENV DISPLAY="host.docker.internal:0"
ENV CONTAINER_NAME="RustDev"

# Copy files to image
ADD rust/*.vim /root/.config/nvim/
ADD rust/coc-settings.json /root/.config/nvim/

# Update base system and install rust
RUN pacman -S --noconfirm rustup gcc tar && \
    echo -e "Y\nY\n" | pacman -Scc && \
    rustup toolchain install stable && \
    rustup component add rustfmt && \
    rustup component add clippy && \
    rustup component add rust-src

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
    nvim -c "CocInstall coc-rust-analyzer" -c 5sleep -c q && \
    # Support highlight
    nvim -c "CocInstall coc-highlight" -c 5sleep -c q

# Update indices
RUN cargo search vulkan
ADD rust/cargo.config /root/.cargo/config
# -----------------------------------------------------------------------------------

