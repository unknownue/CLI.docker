
# Docker container for bevy development
docker run -id --rm \
	-e DISPLAY=unix:0 \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/unknownue/Workspace/:/workspace \
	--device /dev/nvidia0 \
	--device /dev/nvidia-uvm \
	--device /dev/nvidia-uvm-tools \
	--device /dev/nvidiactl \
	--gpus all \
	--name cg \
	-e NVIDIA_DRIVER_CAPABILITIES=graphics,display,compute,utility \
	-w /workspace \
	--shm-size 8G \
	unknownue/cg:vk1.3.216-rust1.67

# Docker container for LLM models
docker run -d \
	--gpus=all \
	-v /home/unknownue/Database/ollama:/home/unknownue/.ollama \
	-v /home/unknownue/Workspace/:/workspace \
	-p 11434:11434 \
	-p 8751:8751 \
	-p 8752:8752 \
	-w /workspace \
	--name ollama \
	unknownue/ollama:0.1.17

# File server
cd /home/unknownue/Workspace/utility/static-http-server
bash launch-filebrowser.sh

# Enable tailscale
tailscale up

# x0vncserver -rfbauth .vnc/passwd
