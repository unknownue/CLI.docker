
FROM nvidia/cuda:12.1.0-cudnn8-devel-ubuntu22.04

ARG DOCKER_USER=unknownue
ARG DOCKER_EMAIL=unknownue@outlook.com
ARG PROJECT_DIRECTORY=myproject
ARG RUST_TOOLCHAIN=nightly
ARG VULKAN_VERSION=1.3.216.0

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=American/New_York
ENV NVIDIA_DRIVER_CAPABILITIES compute,graphics,utility,display
ENV PATH="/home/$DOCKER_USER/.local/bin:${PATH}"
ENV PATH="/user/local/cargo/bin/:${PATH}"

RUN apt update && \
    apt install -y --no-install-recommends ca-certificates git wget sudo curl pkg-config neovim \
    xorg-dev libwayland-dev libx11-dev libxcursor-dev libxrandr-dev libxi-dev libx11-xcb-dev libx11-xcb-dev \
    librust-alsa-sys-dev librust-libudev-sys-dev \
    pulseaudio-utils python3 \

# Docker user -------------------------------------------------------------------
# See also http://gbraad.nl/blog/non-root/user/inside-a-docker-container.html
RUN adduser --disabled-password --gecos '' $DOCKER_USER && \
    adduser $DOCKER_USER sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    echo "[core]editor=nvim" >> ~/.gitconfig && \
    git config --global user.email unknownue@outlook.com && \
    git config --global user.name unknownue
USER $DOCKER_USER

# Audio
# See also https://github.com/TheBiggerGuy/docker-pulseaudio-example/tree/master
RUN sudo gpasswd -a $DOCKER_USER audio
COPY pulse-client.conf /etc/pulse/client.conf

# Python deps
RUN curl https://bootstrap.pypa.io/get-pip.py -sLo get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py
RUN python3 -m pip install --no-cache-dir pqi && \
    mkdir -p /home/$DOCKER_USER/.config && \
    pqi use aliyun && \
    python3 -m pip install --no-cache-dir pyautogen

# Install Vulkan SDK
WORKDIR /opt
COPY nvidia_icd.json /etc/vulkan/icd.d/nvidia_icd.json
RUN sudo wget https://sdk.lunarg.com/sdk/download/$VULKAN_VERSION/linux/vulkansdk-linux-x86_64-$VULKAN_VERSION.tar.gz -O VulkanSDK.tar.gz && \
    sudo tar xzf VulkanSDK.tar.gz && sudo mv $VULKAN_VERSION VulkanSDK && \
    sudo rm VulkanSDK.tar.gz && \
    echo 'source /opt/VulkanSDK/setup-env.sh' >> $HOME/.bashrc

WORKDIR /workspace

# Install rust toolchain (https://rust-lang.github.io/rustup/installation/other.html)
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly
# RUN rustup_url="https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-musl/rustup-init" && \
#     sudo wget "$rustup_url" && \
#     sudo chmod +x rustup-init && \
#     sudo ./rustup-init -y --no-modify-path --default-toolchain $RUST_TOOLCHAIN && \
#     sudo rm rustup-init

# RUN sudo chmod -R a+w /usr/local/rustup /usr/local/cargo && \
#     rustup --version && \
#     cargo --version && \
#     rustc --version

ADD startup.sh
CMD ["sh", "-c", "startup.sh"]

