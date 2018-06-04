# #!/usr/bin/env bash

docker image rm -f $(docker images -f "dangling=true" -q) > /dev/null 2>&1 # remove images that are: <none>



imgs=($( printf "%s\n" $(docker images --format "{{.Repository}}") | sort -u))

for i in "${imgs[@]}"
do
   echo " pulling image: $i"
   docker pull $i
   # or do whatever with individual element of the array
done

