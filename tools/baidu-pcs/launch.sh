#!/usr/bin/bash

# Usage bash launch "bypy info"
docker run -it --rm -v $(pwd):/root/dev -w /root/dev unknownue/bypy bypy $1
