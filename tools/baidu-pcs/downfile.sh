#!/usr/bin/bash

docker run -it --rm -v $(pwd):/workspace -w /workspace unknownue/bypy bypy --retry 1 downfile $1 ~/download/
