docker run -d \
    --name aria2-ariang \
    -p 6800:6800 -p 6880:80 -p 6888:8080 \
    -v ~/Downloads:/aria2/downloads \
    -v /root/Services/aria2-ariang:/aria2/conf \
    colinwjd/aria2-ariang

