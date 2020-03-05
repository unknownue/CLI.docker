
# -----------------------------------------------------------------------------------
FROM ubuntu:18.04 AS taichi-cpu

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="An docker environment to play with taichi programming language"
LABEL taichi-version="0.3.21"
LABEL taichi-cuda-version="10.1"
LABEL python-version="3.6.x"
LABEL license="MIT"

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /workspace/

# Install common system-level package
RUN apt update && apt upgrade -y && \
apt install -y --no-install-recommends libx11-6

# Install Python 3.6
RUN apt install -y --no-install-recommends python3.6 python3-pip && \
ln -sf python3.6 /usr/bin/python && ln -sf pip3 /usr/bin/pip && \
pip3 install --upgrade pip && \
pip3 install setuptools --no-cache-dir && \
pip3 install pqi && pqi use aliyun && \
apt autoremove -y && apt clean

# Install taichi
RUN pip3 install taichi-nightly --no-cache-dir && \
apt autoremove -y && apt clean

CMD ["bash"]
# -----------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------
FROM ubuntu:18.04 AS taichi-gpu

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="An docker environment to play with taichi programming language."
LABEL taichi-version="0.3.21"
LABEL taichi-cuda-version="10.1"
LABEL python-version="3.6.x"
LABEL license="MIT"

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /workspace/

# Install common system-level package
RUN apt update && apt upgrade -y && \
apt install -y --no-install-recommends libx11-6

# Install Python 3.6
RUN apt install -y --no-install-recommends python3.6 python3-pip && \
ln -sf python3.6 /usr/bin/python && ln -sf pip3 /usr/bin/pip && \
pip3 install --upgrade pip && \
pip3 install setuptools --no-cache-dir && \
pip3 install pqi && pqi use aliyun && \
apt autoremove -y && apt clean

# Install taichi
RUN pip3 install taichi-nightly-cuda-10-1 --no-cache-dir && \
apt autoremove -y && apt clean

CMD ["bash"]
# -----------------------------------------------------------------------------------
