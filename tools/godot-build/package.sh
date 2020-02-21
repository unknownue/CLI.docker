
# Usage:
# $ bash package.sh path/to/place/Godot.app
# Example:
# $ bash package.sh /Applications/

cp -r misc/dist/osx_tools.app $1/Godot.app
mkdir -p $1/Godot.app/Contents/MacOS
cp bin/godot.osx.tools.64 $1/Godot.app/Contents/MacOS/Godot
chmod +x $1/Godot.app/Contents/MacOS/Godot
