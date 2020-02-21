
# See also guide from official documentation
# https://docs.godotengine.org/en/latest/development/compiling/index.html

# -----------------------------------------------------------------------------------
FROM archlinux/base:latest AS build-base

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A docker environment to build godot engine from source."
LABEL license="MIT"

# COPY mirrorlist /etc/pacman.d/mirrorlist

# Update base system and necessary package
RUN pacman -Syy --noconfirm --noprogressbar && \
    pacman -S --noconfirm git python && \
    echo -e "Y\nY\n" | pacman -Scc

# Install SCons build system and clang compiler
RUN pacman -S --noconfirm --noprogressbar scons clang && \
    echo -e "Y\nY\n" | pacman -Scc

WORKDIR /root/dev
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
FROM build-base AS mac-build

WORKDIR /root

# Clone OSXCross and install build dependencies
RUN pacman -S --noconfirm --noprogressbar awk cmake which cpio pkgconf && \
    pacman -S --noconfirm --noprogressbar make patch openssl xz libxml2 && \
    echo -e "Y\nY\n" | pacman -Scc

ENV OSXCROSS_ROOT=/root/osxcross

CMD ["bash"]
# -----------------------------------------------------------------------------------
