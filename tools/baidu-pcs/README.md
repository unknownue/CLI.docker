
# Run bypy in docker
See also https://github.com/houtianze/bypy

## Installation
Save the authorization code to `authorization.txt`.

The authorizatied link can be found by:
```shell
$ pip install bypy
$ bypy info
```

Then build the docker image to later use
```shell
$ docker build -t unknownue/bypy -f bypy.Dockerfile .
```

## Usage
```shell
# List the content in bypy directroy in baidu pcs
$ bash launch.sh "list"

# See the space in baidu pcs
$ bash launch.sh "info"

# Download a file
$ bash downfile.sh "remote/file/path"
$ bash launch.sh "downfile -v remote/file/path ."
```
