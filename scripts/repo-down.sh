
git clone $1
repo=$1
dir_name=${repo##https://github.com/rust-lang/}

7z a $dir_name.7z $dir_name
rm -r $dir_name

