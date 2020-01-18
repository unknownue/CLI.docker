

FROM archlinux:20200106 AS arch-base

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A command-line environment with personal configuration in docker."
LABEL license="MIT"

WORKDIR /home/arch-build
RUN pacman -Syy && \
    pacman -S sudo binutils fakeroot git fish neovim --noconfirm && \
    pacman -S fontconfig xorg-mkfontscale xorg-mkfontdir --noconfirm

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
RUN curl -Lo ~/.local/bin/chips --create-dirs \
    https://github.com/xtendo-org/chips/releases/download/1.1.2/chips_gnulinux && \
    chmod +x ~/.local/bin/chips && \
    ~/.local/bin/chips && \
    cp -r /home/arch-build/config/fish/functions/. ~/.config/fish/functions/

WORKDIR /root/dev

# Clean package cache
RUN pacman -Scc --noconfirm && rm -r /home/arch-build

CMD ["fish"]
