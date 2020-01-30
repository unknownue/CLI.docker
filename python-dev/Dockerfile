
# -----------------------------------------------------------------------------------
FROM archlinux/base:20200106 AS install-env

# Change current root path to tmp directory path
WORKDIR /tmp

RUN \
    useradd builduser -m && \
    passwd -d builduser && \
    # enable builduser to sudo without password
    printf 'root ALL=(ALL) ALL\nbuilduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers && \
    pacman -Syy && \
    pacman -S --noconfirm sudo fakeroot git base-devel libnsl && \
    echo -e "Y\nY" | pacman -Scc

# Install python
RUN git clone https://aur.archlinux.org/python36.git && \
    chmod 777 /tmp/python36 && \
    # git clone https://aur.archlinux.org/python37.git && \
    cd python36 && \
    # utilise sudo to builduser in order to make the gss-ntlmssp package
    sudo --user=builduser bash makepkg -s --noconfirm && \
    mv python36-3.6.10-1-x86_64.pkg.tar.xz python36.pkg.tar.xz

# Install Nerd Font
RUN git clone https://aur.archlinux.org/nerd-fonts-hack.git && \
    chmod 777 /tmp/nerd-fonts-hack && \
    cd nerd-fonts-hack && sudo --user=builduser bash makepkg -s --noconfirm && \
    mv nerd-fonts-hack-2.0.0-1-any.pkg.tar.xz nerd-fonts-hack.pkg.tar.xz
# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
FROM archlinux/base:20200106 AS arch-python-dev
COPY --from=install-env ["/tmp/python36/python36.pkg.tar.xz", "/tmp/python36.pkg.tar.xz"]
COPY --from=install-env ["/tmp/nerd-fonts-hack/nerd-fonts-hack.pkg.tar.xz", "/tmp/nerd-fonts-hack.pkg.tar.xz"]

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A python development environment with personal configuration in docker."
LABEL python-version="3.6.x"
LABEL license="MIT"

WORKDIR /tmp

# Copy files to image
COPY config/. config/
COPY system/. system/
COPY python-dev/. config/nvim/
RUN \
    cp -r config/. ~/.config/ && rm -r config/ && \
    cp -r system/. ~/ && rm -r system/

# Install python
RUN pacman -Syy && \
    pacman -U --noconfirm python36.pkg.tar.xz && \
    rm python36.pkg.tar.xz && \
    ln -sf /usr/bin/python3.6 /usr/bin/python && \
    ln -sf /usr/bin/python3.6 /usr/bin/python3 && \
    # Install pip
    curl https://bootstrap.pypa.io/get-pip.py -sLo get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

# Install Nerd Font
RUN pacman -U --noconfirm nerd-fonts-hack.pkg.tar.xz && \
    rm nerd-fonts-hack.pkg.tar.xz

# Config neovim
# https://jdhao.github.io/2018/09/05/centos_nvim_install_use_guide/
RUN pacman -S neovim git --noconfirm --needed && \
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    pip install pynvim jedi yapf pylint --no-cache-dir && \
    nvim +slient +VimEnter +PlugInstall +qal && \
    echo -e "Y\nY" | pacman -Scc

WORKDIR  /root/dev/
CMD [ "bash" ]
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
FROM arch-python-dev AS arch-torch-dev

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A pytorch environment with personal configuration in docker."
LABEL torch-version="1.4.0"
LABEL torchvision-version="0.5.0"
LABEL license="MIT"

WORKDIR /tmp

RUN pip install torch==1.4.0 torchvision==0.5.0 --no-cache-dir && \
    pip install visdom==0.1.8.9 scipy==1.3.1 h5py==2.10.0 torchsnooper==0.7.1 torchsummaryX==1.3.0 --no-cache-dir

# Configure visom download scripts
RUN git https://github.com/unknownue/mirror-visdom-static.git && \
    cp -r ./mirror-visdom-static/static/ $(echo "$(pip show visdom | grep Location | grep -o '/.*/*')/visdom") && \
    rm -r ./mirror-visdom-static/

ENV VISDOM_PORT=8097
EXPOSE $VISDOM_PORT

WORKDIR /root/dev
CMD [ "bash" ]
# -----------------------------------------------------------------------------------
