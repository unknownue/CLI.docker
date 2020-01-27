
function docker-torch --description "Launch torch development environment in docker."
    docker run --rm -it -v (pwd):/root/dev/ -w /root/dev/ arch/torch-dev
end
