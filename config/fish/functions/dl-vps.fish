function dl-vps --description "Parallel and resumable download with aria2c"
    aria2c -c -x 4 --file-allocation=prealloc --http-user=unknownue --http-passwd=DU94484@wwj@@0j $argv[1]
end
