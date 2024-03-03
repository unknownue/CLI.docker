
# Docker container for bevy development
docker run -d \
	-e DISPLAY=unix:0 \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	--device /dev/nvidia0 \
	--device /dev/nvidia-uvm \
	--device /dev/nvidia-uvm-tools \
	--device /dev/nvidiactl \
	--device /dev/snd \
	--gpus all \
	--name bevy-dev \
	--shm-size 8G \
	--runtime=nvidia \
	-p 8081:8081 \
	-p 8761-8770:8761-8770 \
	-w /workspace \
	-v /home/unknownue/Workspace/:/workspace \
	-v /home/unknownue/Database/:/database \
	unknownue/bevy:cuda121

# Docker container for LLM models
docker run -d \
	--gpus=all \
	-v /home/unknownue/Database/ollama:/home/unknownue/.ollama \
	-v /home/unknownue/Workspace/:/workspace \
	-p 11434:11434 \
	-p 8751-8760:8751-8760 \
	-w /workspace \
	--name ollama \
	unknownue/ollama:0.1.17

# File server
cd /home/unknownue/Workspace/utility/static-http-server
bash launch-filebrowser.sh

# Enable tailscale
tailscale up

# x0vncserver -rfbauth .vnc/passwd
