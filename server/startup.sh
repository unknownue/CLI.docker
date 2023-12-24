
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

cd /home/unknownue/Workspace/utility/static-http-server
bash launch-filebrowser.sh

# x0vncserver -rfbauth .vnc/passwd

