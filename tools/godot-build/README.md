
# Build godot engine in docker for macOS

- Clone osxcross and godot
```shell
$ git clone https://github.com/godotengine/godot PATH1
$ git clone https://github.com/tpoechtrager/osxcross PATH2
```

- Download Xcode(Xcode_xx.xip) to PATH2/tarballs 

See https://developer.apple.com/download/more

- Build base image
```shell
$ docker build -t unknownue/godot-build --target mac-build .
```

- Run the container to build the engine
```shell
$ docker run -it --rm \
    -v PATH2/godot:/root/dev \
    -v PATH1/osxcross:/root/osxcross \
    -w /root \
    unknownue/godot-build

(container) $ # Run as build.sh
```
