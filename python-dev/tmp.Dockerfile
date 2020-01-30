
# -----------------------------------------------------------------------------------
FROM arch/python-dev:latest AS arch-torch-dev

LABEL maintainer="unknownue <usami-ssc@protonmail.com>"
LABEL description="A pytorch environment with personal configuration in docker."
LABEL torch-version="1.4.0"
LABEL torchvision-version="0.5.0"
LABEL license="MIT"

WORKDIR /tmp

COPY torch-1.4.0-cp36-cp36m-manylinux1_x86_64.whl torch-1.4.0-cp36-cp36m-manylinux1_x86_64.whl
RUN pip install -U torch-1.4.0-cp36-cp36m-manylinux1_x86_64.whl && rm torch-1.4.0-cp36-cp36m-manylinux1_x86_64.whl
RUN pip install pqi --no-cache-dir && pqi use aliyun
RUN pip install torchvision==0.5.0 visdom==0.1.8.9 scipy==1.3.1 h5py==2.10.0 torchsnooper==0.7.1 torchsummaryX==1.3.0 --no-cache-dir

# Configure visom download scripts
COPY ./mirror-visdom-static/. ./mirror-visdom-static/
# RUN git clone https://github.com/unknownue/mirror-visdom-static.git && \
RUN cp -r ./mirror-visdom-static/static/ $(echo "$(pip show visdom | grep Location | grep -o '/.*/*')/visdom") && \
    rm -r ./mirror-visdom-static/

ENV VISDOM_PORT=8097
EXPOSE $VISDOM_PORT

WORKDIR /root/dev
CMD [ "bash" ]
# -----------------------------------------------------------------------------------
