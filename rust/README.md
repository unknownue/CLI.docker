
Rust development configuration in docker

Build:
```shell
$ docker build -t unknownue/rust -f rust/rust.Dockerfile .
```

Run:
```shell
$ docker run -it --rm \
    -v ~/.cargo/registry:/root/.cargo/registry \
    -v $(pwd):/root/dev \
    -w /root/dev \
    unknownue/rust
```
