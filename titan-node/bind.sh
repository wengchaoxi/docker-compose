#!/bin/bash

hash=30BB0E47-F46A-4577-BA4E-B59738945523

container_ids=$(docker ps --format '{{.Names}}' | grep titan-node)

flags_path="./data/flags"
mkdir -p $flags_path

for id in $container_ids
do
    if [ ! -f "$flags_path/$id" ]; then
        echo "Container: $id"
        docker exec -it $id titan-edge bind --hash=$hash https://api-test1.container1.titannet.io/api/v2/device/binding
        touch "$flags_path/$id"
    else
        echo "Skipping container $id"
    fi
done
