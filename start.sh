#!/bin/bash

echo "Starting CTF Tools..."
docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctftools -i marieif/ctftools > /dev/null

docker exec -it ctftools /bin/zsh

echo "Stopping CTF Tools..."
docker stop -t 1 ctftools > /dev/null
