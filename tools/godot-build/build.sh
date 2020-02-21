
cd /root/osxcross
./tools/gen_sdk_package_pbzx.sh tarballs/Xcode*.xip
UNATTENDED=1 ./build.sh
export PATH="/root/osxcross/target/bin:$PATH"

cd /root/dev
scons platform=osx
