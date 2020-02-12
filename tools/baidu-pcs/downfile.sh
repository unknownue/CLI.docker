#!/usr/bin/bash

docker run -it --rm -v $(pwd):/root/dev -w /root/dev unknownue/bypy bypy --retry 1 downfile $1 ~/download/
