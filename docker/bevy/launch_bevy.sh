#!/bin/bash

container_name="bevy-dev"
image_name="unknownue/bevy:cuda121"

# Step 1: Detect if there is a docker container with the specified name
if [[ "$(docker ps -a --format '{{.Names}}' | grep -w "$container_name")" ]]; then
  # Step 3: If detected, use "docker exec" to the container
  echo "Container '$container_name' found. Executing command inside the container..."
  docker exec -it "$container_name" bash
else
  # Step 2: If not detected, launch a docker image with the specified name
  echo "Container '$container_name' not found. Launching a new container..."
   docker run -d \
            -e DISPLAY=unix:0 \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            --device /dev/nvidia0 \
            --device /dev/nvidia-uvm \
            --device /dev/nvidia-uvm-tools \
            --device /dev/nvidiactl \
            --device /dev/snd \
            --gpus all \
            --name $container_name \
            --shm-size 8G \
            --runtime=nvidia \
            -p 8081:8081 \
            -p 8761-8770:8761-8770 \
            -w /workspace \
            -v /home/unknownue/Workspace/:/workspace \
            -v /home/unknownue/Database/:/database \
            $image_name
fi
