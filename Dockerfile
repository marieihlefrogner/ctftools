FROM ubuntu:20.04

ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM xterm

RUN dpkg --add-architecture i386

RUN apt-get update
RUN apt-get install -y software-properties-common curl
RUN apt-get update
RUN add-apt-repository universe
RUN apt-get update
RUN apt-get install -y python2 python2-dev
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
RUN python2 get-pip.py

RUN apt-get update && \
    apt-get install -y \
    build-essential zsh jq strace ltrace wget rubygems gcc dnsutils netcat tmux \
    gcc-multilib net-tools vim gdb gdb-multiarch python3 python3-pip python3-dev \
    libssl-dev libffi-dev wget git make procps libpcre3-dev libdb-dev libxt-dev libxaw7-dev \
    libc6:i386 libncurses5:i386 libstdc++6:i386 zbar-tools imagemagick

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install -y nodejs

# npm packages
RUN npm install -g qrcode

# Python 2.7 packages
RUN pip2 install pwntools

# Python 3.x packages
RUN pip3 install keystone-engine unicorn capstone ropper pwntools

# Ruby packages
RUN gem install zsteg

# Install GDB-Peda
RUN git clone https://github.com/longld/peda.git ~/peda && echo "source ~/peda/peda.py" >> ~/.gdbinit

# Oh my zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

WORKDIR /pwd
