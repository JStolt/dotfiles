#stolt's dockerfile for his dev container

FROM ubuntu:18.04

RUN echo "BUILDING THE BEST DEV ENVIRONMENT EVER!"

RUN apt update \
 && apt install -y --no-install-recommends \
 	git \
 	curl \
	wget \
	zip \
	unzip \
	gzip \
	jq \
	openssh-server \
	python3.8 \
	python3-pip \
	python3-setuptools \
	neovim \
	python3-neovim
	
# SET {XDG_CONFIG_HOME} FOR NVIM AND NVM

RUN echo "alias python=/usr/bin/python3.8" >> ~/.bashrc

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# node js



# go 
RUN wget -c https://golang.org/dl/go1.15.2.linux-amd64.tar.gz
RUN tar -C /usr/local -xvzf go1.15.2.linux-amd64.tar.gz

# scala

# pip install neovim package
RUN python3.8 -m pip install wheel setuptools pynvim

# nvim package manager
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install





RUN echo "BUILT THE COOL THING!"

CMD ["/bin/bash"]
