
function docker-nvim --description "Launch nvim in docker"
    docker run --rm -it -v (pwd):/root/dev/ -w /root/dev/ arch/nvim
end
