
# -----------------------------------------------------------------------------------
FROM arch/python-dev:latest AS arch-torch-dev

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A pytorch environment with personal configuration in docker."
LABEL torch-version="1.4.0"
LABEL torchvision-version="0.5.0"
LABEL license="MIT"

WORKDIR /tmp

COPY torch-1.4.0+cpu-cp36-cp36m-linux_x86_64.whl torch-1.4.0+cpu-cp36-cp36m-linux_x86_64.whl
COPY torchvision-0.5.0+cpu-cp36-cp36m-linux_x86_64.whl torchvision-0.5.0+cpu-cp36-cp36m-linux_x86_64.whl
RUN pip install pqi --no-cache-dir && pqi use aliyun && \
    pip install -U torch-1.4.0+cpu-cp36-cp36m-linux_x86_64.whl && \
    rm torch-1.4.0+cpu-cp36-cp36m-linux_x86_64.whl && \
    pip install -U torchvision-0.5.0+cpu-cp36-cp36m-linux_x86_64.whl && \
    rm torchvision-0.5.0+cpu-cp36-cp36m-linux_x86_64.whl

WORKDIR /root/dev
CMD [ "bash" ]
# -----------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------
FROM nvidia/cuda:latest AS torch-runtime

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A pytorch runtime environment in docker."
LABEL python-version="3.6.x"
LABEL torch-version="1.4.0"
LABEL torchvision-version="0.5.0"
LABEL license="MIT"

WORKDIR /root/dev

COPY /sources.list /etc/apt/sources.list
RUN apt update && \
    apt install wget && \
    apt install -y python3.6 python3.6-distutils && \
    ln -sf python3.6 /usr/bin/python && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && rm get-pip.py && \
    apt autoremove -y && apt clean

# COPY torch-1.4.0-cp36-cp36m-manylinux1_x86_64.whl torch-1.4.0-cp36-cp36m-manylinux1_x86_64.whl
# RUN pip install -U torch-1.4.0-cp36-cp36m-manylinux1_x86_64.whl && \
#     rm torch-1.4.0-cp36-cp36m-manylinux1_x86_64.whl
RUN pip install pqi --no-cache-dir && \
    pqi use aliyun
RUN pip install --no-cache-dir \
    torch==1.4.0 \
    torchvision==0.5.0 \
    visdom==0.1.8.9 \
    scipy==1.3.1 \
    h5py==2.10.0 \
    torchsnooper==0.7.1 \
    torchsummaryX==1.3.0

CMD [ "bash" ]
# -----------------------------------------------------------------------------------
