
FROM ollama/ollama:0.1.17

ARG DOCKER_USER=unknownue
ARG DOCKER_EMAIL=unknownue@outlook.com

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=American/New_York
ENV NVIDIA_DRIVER_CAPABILITIES compute,graphics,utility,display
ENV PATH="/home/$DOCKER_USER/.local/bin:${PATH}"

RUN apt update && \
    apt install -y --no-install-recommends ca-certificates sudo curl git neovim && \
    apt install -y --no-install-recommends python3 python3-pip

# Docker user -------------------------------------------------------------------
# See also http://gbraad.nl/blog/non-root/user/inside-a-docker-container.html
RUN adduser --disabled-password --gecos '' $DOCKER_USER && \
    adduser $DOCKER_USER sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    echo "[core]editor=nvim" >> ~/.gitconfig && \
    git config --global user.email unknownue@outlook.com && \
    git config --global user.name unknownue
USER $DOCKER_USER

RUN pip install --no-cache-dir litellm && \
    pip install --no-cache-dir litellm[proxy]

WORKDIR /workspace

# EXPOSE 8751

ADD startup.sh /workspace/startup.sh
# CMD ["sh", "-c", "/workspace/startup.sh"]
