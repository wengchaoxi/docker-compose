#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root, use: sudo ./bind.sh"
    exit 1
fi

sysctl -w net.core.rmem_max=2500000
sysctl -w net.core.wmem_max=2500000

hash=$1
if [ -z "$hash" ]; then
    hash="30BB0E47-F46A-4577-BA4E-B59738945523"
fi

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

echo "Done"
