
image_name="unknownue/bevy:cuda121"
working_dir="/home/unknownue/Workspace/dotfiles/docker/bevy"

cd $working_dir
docker build -t $image_name -f bevy.Dockerfile .
