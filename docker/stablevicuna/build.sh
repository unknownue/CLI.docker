
image_name="unknownue/stablevicuna:13B"
working_dir="/home/unknownue/Workspace/dotfiles/docker/stablevicuna"

cd $working_dir
docker build -t $image_name -f stablevicuna.Dockerfile .
