# CTF tools in Docker

- Based on https://github.com/LiveOverflow/pwn_docker_example/tree/master/ctf
- Collection of useful tools for CTF challenges, bundled up in a Docker image based on Ubuntu.
- Makes the current working directory available within the container (`/pwd`).
- Very useful if you are on Mac OS, and want to be able to run binaries compiled for Linux.
- Feel free to fork this repo and add the tools you want!

---

## Setup
- Install Docker: https://docs.docker.com/install/
- `./build.sh`

## Run 
- `./start.sh`

## Make it easier to run 
- Open `~/.bash_profile` in a text editor (or wherever you have your bash aliases and functions)
- Write (replace `/path/to/this/repo` with the actual path):
    ```
    ctftools() {
            if [ "$1" = "build" ]; then
                    /path/to/this/repo/build.sh
            else
                    /path/to/this/repo/start.sh
            fi
    }
    ```
- `source ~/.bash_profile` to load the changes
- Now you can build with the command `ctftools build` and run with `ctftools` from anywhere!

---

## Tool/package list
From apt: 
```
zsh jq strace ltrace curl wget rubygems gcc dnsutils netcat gcc-multilib net-tools vim gdb gdb-multiarch python python-pip python3 python3-pip python3-dev libssl-dev libffi-dev  git make procps libpcre3-dev libdb-dev libxt-dev libxaw7-dev libc6:i386 libncurses5:i386 libstdc++6:i386
```

From pip3:
```
keystone-engine unicorn capstone ropper pwntools
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