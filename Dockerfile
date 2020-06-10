FROM ubuntu:19.10
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386

RUN apt-get update && \
    apt-get install -y \
    build-essential zsh jq strace ltrace curl wget rubygems gcc dnsutils netcat \
    gcc-multilib net-tools vim gdb gdb-multiarch python python3 python3-pip python3-dev \
    libssl-dev libffi-dev wget git make procps libpcre3-dev libdb-dev libxt-dev libxaw7-dev \
    python-pip libc6:i386 libncurses5:i386 libstdc++6:i386

ENV TERM xterm

# Python 2.7 packages
RUN pip install pwntools

# Python 3.x packages
RUN pip3 install keystone-engine unicorn capstone ropper pwntools

# Ruby packages
RUN gem install zsteg

# Install GDB-Peda
RUN git clone https://github.com/longld/peda.git ~/peda && echo "source ~/peda/peda.py" >> ~/.gdbinit

# Oh my zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

WORKDIR /pwd