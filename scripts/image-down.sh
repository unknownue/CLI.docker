
# usage:
# bash image-down.sh image_id output_name

echo "Storing image to local..."
docker save -o ~/download/$2 $1
echo "Removing pull image..."
docker rmi $1
chmod 777 ~/download/$2

local_ip=$(ip -4 address show | grep inet | grep -m1 -v 127.0.0 | awk '{print $2}' | cut -d'/' -f1)

echo "Finish."
echo "Download links:"
echo "    http://$local_ip:8088/$2"
echo "    http://$local_ip:6088/$2"

