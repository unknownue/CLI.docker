
Python development configuration in docker

Image for python development

```shell
$ docker build -t unknownue/python-dev --target arch-python-dev -f python/pytorch.Dockerfile .
```

Image for [PyTorch](https://pytorch.org) development(GPU)

```shell
$ docker build -t unknownue/torch-runtime --target arch-torch-runtime -f python/torch.Dockerfile .
```

Image for [PyTorch](https://pytorch.org) development(CPU)

```shell
$ docker build -t unknownue/torch-dev --target arch-torch-dev -f python/torch.Dockerfile .
```

Image for [taichi](https://github.com/taichi-dev/taichi) development(GPU)

```shell
$ docker build -t unknownue/taichi-dev --target taichi-gpu -f python/torch.Dockerfile .
```
