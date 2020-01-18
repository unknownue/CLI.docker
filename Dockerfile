

FROM archlinux:20200106 AS arch-base

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A command-line environment with personal configuration in docker."
LABEL license="MIT"

WORKDIR /root/home
RUN pacman -Syy && \
    pacman -S sudo binutils fakeroot git fish neovim --noconfirm && \
    pacman -S fontconfig xorg-mkfontscale xorg-mkfontdir --noconfirm

# Copy files to image
COPY config/ ./config/
COPY system/ ./system/
RUN cp -a config/ ~/.config/ && cp -a system/ ~/

# Add common user
RUN useradd unknownue && \
    echo -e "unknownue\nunknownue" | passwd unknownue && \
    usermod -a -G adm unknownue && \
    echo "unknownue ALL=(ALL)  ALL" > /etc/sudoers

# Install nerd font
RUN git clone https://aur.archlinux.org/nerd-fonts-hack.git && chmod a+w nerd-fonts-hack
WORKDIR /root/home/nerd-fonts-hack/
RUN su unknownue && \
    echo -e "unknownue" | makepkg -si --noconfirm && \
    exit && \
    curl -Lo ~/.local/bin/chips --create-dirs \
    https://github.com/xtendo-org/chips/releases/download/1.1.2/chips_gnulinux \
    ; and chmod +x ~/.local/bin/chips && \
    ~/.local/bin/chips && \
    cp -r /root/home/config/fish/functions/ ~/.config/fish/functions/

WORKDIR /root/home/

RUN rm -r nerd-fonts-hack/

# Clean package cache
RUN pacman -Scc

CMD ["fish"]
