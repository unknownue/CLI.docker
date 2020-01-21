# CLI.docker

Personal development configuration in docker.



Base image:

```shell
$ docker build -t arch/base  .
```

Image for neovim edit:

```shell
$ build -t arch-nvim --target arch/nvim .
```

Image for python development

```shell
$ docker build -t arch-python-dev --target arch/python-dev -f python-dev/Dockerfile .
```

Image for PyTorch development

```shell
$ docker build -t arch-torch-dev --target arch/torch-dev -f python-dev/torch.Dockerfile .
```

