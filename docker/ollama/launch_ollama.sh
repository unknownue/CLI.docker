#!/bin/bash


container_name="ollama"
image_name="unknownue/ollama:0.1.17"

# Step 1: Detect if there is a docker container with the specified name
if [[ "$(docker ps -a --format '{{.Names}}' | grep -w "$container_name")" ]]; then
    # Step 3: If detected, use "docker exec" to the container
    echo "Container '$container_name' found. Executing command inside the container..."
    docker exec -it "$container_name" bash
else
    # Step 2: If not detected, launch a docker image with the specified name
    echo "Container '$container_name' not found. Launching a new container..."
    docker run -d \
        --gpus=all \
        --shm-size 8G \
        --runtime=nvidia \
        -v /home/unknownue/Database/ollama:/home/unknownue/.ollama \
        -v /home/unknownue/Workspace/:/workspace \
        -p 11434:11434 \
        -p 8751-8760:8751-8760 \
        -w /workspace \
        --name $container_name \
        $image_name
fi
