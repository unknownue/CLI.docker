
FROM arch/python-dev AS arch/torch-dev

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A pytorch environment with personal configuration in docker."
LABEL torch-version="1.4.0"
LABEL torchvision-version="0.5.0"
LABEL license="MIT"

WORKDIR /root/dev

RUN pip install torch==1.4.0 torchvision==0.5.0 --no-cache-dir && \
    pip install visdom==0.1.8.9 scipy==1.3.1 h5py==2.10.0 torchsnooper==0.7.1 torchsummaryX==1.3.0 --no-cache-dir

# Configure visom download scripts
RUN git clone --branch v0.1.8.9 https://github.com/unknownue/mirror-visdom-static.git && \
    cp -r ./mirror-visdom-static/static/ $(echo "$(pip show visdom | grep Location | grep -o '/.*/*')/visdom") && \
    rm -r ./mirror-visdom-static/

ENV VISDOM_PORT=8097
EXPOSE $VISDOM_PORT
