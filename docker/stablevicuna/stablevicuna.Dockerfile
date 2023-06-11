
FROM nvcr.io/nvidia/pytorch:23.05-py3

ARG DOCKER_USER=unknownue
ARG DOCKER_EMAIL=unknownue@outlook.com

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=American/New_York
ENV NVIDIA_DRIVER_CAPABILITIES compute,graphics,utility,display
ENV PATH="/home/$DOCKER_USER/.local/bin:${PATH}"

# Docker user -------------------------------------------------------------------
# See also http://gbraad.nl/blog/non-root/user/inside-a-docker-container.html
RUN adduser --disabled-password --gecos '' $DOCKER_USER && \
    adduser $DOCKER_USER sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    echo "[core]editor=nvim" >> ~/.gitconfig && \
    git config --global user.email unknownue@outlook.com && \
    git config --global user.name unknownue
USER $DOCKER_USER

RUN pip install --no-cache-dir jupyter


# Expose the Jupyter Notebook port
EXPOSE 8888

# Start Jupyter Notebook when the container launches
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow_remote_access=true", "--NotebookApp.disable_check_xsrf=True", "--NotebookApp.token=''", "--NotebookApp.password=''", "--no-browser"]
