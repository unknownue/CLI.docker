
image_name="unknownue/ollama:0.1.17"
working_dir="/home/unknownue/Workspace/dotfiles/docker/ollama"

cd $working_dir
docker build -t $image_name -f ollama.Dockerfile .
