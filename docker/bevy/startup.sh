
path_from1=/workspace/plg/target/git
path_from2=/workspace/plg/target/registry
path_to1=$HOME/.cargo/git
path_to2=$HOME/.cargo/registry

if [ ! -L "$path_from1" ]; then
	mkdir -p $path_from1
fi

if [ ! -L "$path_from2" ]; then
	mkdir -p $path_from2
fi

if [ ! -L "$path_to1" ]; then
	ln -s $path_from1 $path_to1
	echo "Create softlink: $path_from1 -> $path_to1"
fi

if [ ! -L "$path_to2" ]; then
	ln -s $path_from2 $path_to2
	echo "Create softlink: $path_from2 -> $path_to2"
fi

