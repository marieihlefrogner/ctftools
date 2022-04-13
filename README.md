# CTF tools in Docker

- Based on https://github.com/LiveOverflow/pwn_docker_example/tree/master/ctf
    - Video here: https://www.youtube.com/watch?v=cPGZMt4cJ0I
- Collection of useful tools for CTF challenges, bundled up in a Docker image based on Ubuntu.
- Makes the current working directory available within the container (`/pwd`).
- Very useful if you are on Mac OS, and want to be able to run binaries compiled for Linux.
- Feel free to fork this repo and add the tools you want!
- *Note*: Not tested on Windows
---

## Setup
- Install Docker: https://docs.docker.com/install/
- Optionally you can clone this repo and build it youself before running: `./build.sh`
- Run docker image (in the directory you want to work from): `./start.sh` or if you don't want to clone: 

```bash
docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctftools -i marieif/ctftools > /dev/null && \
docker exec -it ctftools /bin/zsh; docker stop -t 1 ctftools > /dev/null
```

---

## Tool/package list - this is included from the Dockerfile
From apt: 
```
build-essential zsh jq strace ltrace wget rubygems gcc dnsutils netcat tmux
gcc-multilib net-tools vim gdb gdb-multiarch python3 python3-pip python3-dev
libssl-dev libffi-dev wget git make procps libpcre3-dev libdb-dev libxt-dev libxaw7-dev
libc6:i386 libncurses5:i386 libstdc++6:i386 zbar-tools imagemagick nodejs
```

From npm
```
qrcode
```

From pip3 (python3.x):
```
keystone-engine unicorn capstone ropper pwntools
```

From pip (python2.7):
```
pwntools
```

From gem:
```
zsteg
```

Other:
```
gdb-peda
```

Shell: zsh with oh-my-zsh