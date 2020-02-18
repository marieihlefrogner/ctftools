# CTF tools in Docker

- Collection of useful tools for CTF challenges, bundled up in a Docker image based on Ubuntu.
- Makes the current working directory available within the container (`/pwd`).

---

## Setup
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
