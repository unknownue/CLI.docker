# CLI.docker

Personal development configuration in docker.



Base image:

```shell
$ docker build -t arch/base --target arch-base .
```

Image for neovim edit:

```shell
$ docker build -t arch/nvim --target arch-nvim .
```

Image for python development

```shell
$ docker build -t arch/python-dev --target arch-python-dev -f python-dev/Dockerfile .
```

Image for PyTorch development(GPU)

```shell
$ docker build -t arch/torch-runtime --target arch-torch-runtime -f python-dev/torch.Dockerfile .
```

Image for PyTorch development(CPU)

```shell
$ docker build -t arch/torch-dev --target arch-torch-dev -f python-dev/torch.Dockerfile .
```

Image for [taichi](https://github.com/taichi-dev/taichi) development(GPU)

```shell
$ docker build -t arch/taichi-dev --target taichi-gpu -f python-dev/torch.Dockerfile .
```

