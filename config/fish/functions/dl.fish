
# From https://bits.mdminhazulhaque.io/linux/create-custom-functions-for-fish.html
function dl --description "Parallel and resumable download with aria2c"
    aria2c -c -x 4 --file-allocation=prealloc $argv[1]
end

