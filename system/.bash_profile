
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

alias vim='nvim'

# Run "dfimage image_id" to extract Dockerfile
alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm chenzj/dfimage"
