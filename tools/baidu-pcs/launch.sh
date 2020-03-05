#!/usr/bin/bash

# Usage bash launch "bypy info"
docker run -it --rm -v $(pwd):/workspace -w /workspace unknownue/bypy bypy $1
