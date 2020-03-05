
function docker-torch --description "Launch torch development environment in docker."
    docker run --rm -it -v (pwd):/workspace/ -w /workspace/ arch/torch-dev
end
