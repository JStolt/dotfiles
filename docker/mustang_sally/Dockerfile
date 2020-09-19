#stolt's dockerfile for his dev container

FROM ubuntu:18.04

RUN echo "MUSTANT_SALLY, RIDE!!!!!!!"

RUN apt update \
 && apt install -y --no-install-recommends \
 	git \
 	curl \
	ca-certificates \
	wget \
	zip \
	unzip \
	gzip \
	jq \
	openssh-server \
	neovim \
	python3-neovim \
	zsh
	
	#python3.8 \
	#python3-setuptools \
# node js

# go 
RUN wget -cq https://golang.org/dl/go1.15.2.linux-amd64.tar.gz --no-check-certificate \
 && tar -C /usr/local -xzf go1.15.2.linux-amd64.tar.gz

# scala


# nvim package manager
RUN sh -c 'curl -fLosS "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# awscli
RUN curl -sS "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
 && unzip -q awscliv2.zip \
 && ./aws/install

# oh-my-zsh
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" \
 && usermod -s $(which zsh) $(whoami)

# pip install neovim package
RUN apt install python3-pip -y \
 && python3 -m pip install wheel setuptools pynvim


# Clone my repo and get config files
RUN mkdir -p ~/dev/gitrepos/ && cd ~/dev/gitrepos/ && git clone https://github.com/JStolt/dotfiles.git \
 && mkdir -p ~/.config/nvim/ \
 && ln -sf ~/dev/gitrepos/dotfiles/nvim/init.vim ~/.config/nvim/ \
 && ln -sf ~/dev/gitrepos/dotfiles/system/.zshrc ~/.zshrc

RUN echo "BUILT THE COOL THING!!!!!!!!!!!"

CMD ["/bin/zsh"]
