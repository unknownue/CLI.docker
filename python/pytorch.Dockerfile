
# -----------------------------------------------------------------------------------
FROM unknownue/arch-env:latest AS install-env

# Change current root path to tmp directory path
WORKDIR /tmp

# Install tools to build python from source
RUN pacman -S --noconfirm --noprogressbar --need \
    sudo fakeroot git base-devel libnsl && \
    echo -e "Y\nY\n" | pacman -Scc

# Install python
RUN git clone https://aur.archlinux.org/python36.git && \
    chmod 777 /tmp/python36 && \
    # git clone https://aur.archlinux.org/python37.git && \
    cd python36 && \
    # utilise sudo to unknownue in order to make the gss-ntlmssp package
    sudo --user=unknownue bash makepkg -s --noconfirm && \
    mv python36-3.6.10-1-x86_64.pkg.tar.xz python36.pkg.tar.xz
# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
FROM unknownue/arch-env:latest AS arch-python-dev

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A python development environment with personal configuration in docker."
LABEL python-version="3.6.x"
LABEL license="MIT"

WORKDIR /tmp

# Copy files to image
ADD python/. /root/.config/nvim/

# Install python
COPY --from=install-env ["/tmp/python36/python36.pkg.tar.xz", "/tmp/python36.pkg.tar.xz"]
RUN pacman -U --noconfirm python36.pkg.tar.xz && \
    rm python36.pkg.tar.xz && \
    ln -sf /usr/bin/python3.6 /usr/bin/python && \
    ln -sf /usr/bin/python3.6 /usr/bin/python3 && \
    # Install pip
    curl https://bootstrap.pypa.io/get-pip.py -sLo get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

# Config neovim
# https://jdhao.github.io/2018/09/05/centos_nvim_install_use_guide/
RUN pip install --no-cache-dir pynvim jedi yapf flake8 && \
    nvim +slient +VimEnter +PlugInstall +qal

WORKDIR /workspace/
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
FROM arch-python-dev AS arch-torch-dev

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A pytorch environment(CPU) with personal configuration in docker."
LABEL torch-version="1.4.0"
LABEL torchvision-version="0.5.0"
LABEL license="MIT"

ENV DISPLAY=host.docker.internal:0

WORKDIR /tmp

RUN pip install --no-cache-dir \
    torch==1.4.0+cpu torchvision==0.5.0+cpu \
    -f https://download.pytorch.org/whl/torch_stable.html && \
    pip install --no-cache-dir \
    tensorboard==2.1.0 scipy==1.3.1 h5py==2.10.0 torchsnooper==0.7.1 torchsummaryX==1.3.0

WORKDIR /workspace
CMD [ "bash" ]
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
FROM arch-python-dev AS arch-torch-runtime

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A pytorch environment(CPU) with personal configuration in docker."
LABEL torch-version="1.4.0"
LABEL torchvision-version="0.5.0"
LABEL license="MIT"

WORKDIR /tmp

RUN pip install --no-cache-dir \
    torch==1.4.0 torchvision==0.5.0 && \
    pip install --no-cache-dir \
    tensorboard==2.1.0 visdom==0.1.8.9 scipy==1.3.1 h5py==2.10.0 torchsnooper==0.7.1 torchsummaryX==1.3.0

WORKDIR /workspace
CMD [ "bash" ]
# -----------------------------------------------------------------------------------
