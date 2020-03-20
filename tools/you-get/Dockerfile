
From archlinux/base

RUN pacman -Syy && \
    pacman -S --noconfirm python python-pip && \
    pacman -S --noconfirm ffmpeg && \
    echo -e "Y\nY\n" | pacman -Scc

RUN pip3 install --no-cache-dir you-get 

CMD ["bash"]

