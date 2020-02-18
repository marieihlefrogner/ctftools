echo "Starting CTF container..."
docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf:ubuntu19.10 > /dev/null
docker exec -it ctf /bin/zsh

echo "Stopping CTF container..."
docker stop ctf > /dev/null