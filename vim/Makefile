# Build and configure vim

PWD     := $(shell pwd)
NOW     := $(shell date +%Y-%m-%d-%H-%M-%S)

reset   := $(shell tput sgr0)
red     := $(shell tput setaf 1)
green   := $(shell tput setaf 2)
orange  := $(shell tput setaf 3)
blue    := $(shell tput setaf 4)
magenta := $(shell tput setaf 5)
cyan    := $(shell tput setaf 6)
white   := $(shell tput setaf 7)

all: build_vim vim

.PHONY: vim
vim:
	@echo "$(blue)Vim $(reset)"
	@echo "$(blue) Checking vim directories$(reset)"
	@for d in ~/.vim ~/.vim/backups ~/.vim/tmp ~/.vim/bundle; do \
		if ! ((  test -d $$d )); then \
			mkdir -p $$d && \
			echo "$(green)  --> Directory $$d created successfully$(reset)"; \
		else \
			echo "$(red)  --> Directory $$d already exists$(reset)"; \
		fi; \
	done
	@echo "$(blue) Preparing Vundle$(reset)"
	@if ! (( test -d ~/.vim/bundle/Vundle.vim )); then \
		echo "$(green)  -->  Cloning Vundle repository$(reset)"; \
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &&\
		echo "$(green)  --> Vundle repository cloned successfully !$(reset)"; \
	else \
		echo "$(red)  --> Vundle repository already exists$(reset)"; \
	fi
	@echo "$(blue) Checking vim configuration file$(reset)"
	@if ! (( test -f ~/.vimrc )); then \
		echo "$(green)  --> No old vim configuration file, all clean$(reset)" &&\
		echo "$(orange)  --> Linking new vim configuration file$(reset)" &&\
		ln -s $(PWD)/vimrc ~/.vimrc; \
	else \
		echo "$(green)  --> Moving old configuration file to ~/.vimrc.$(NOW)$(reset)" &&\
		cp ~/.vimrc ~/.vimrc.$(NOW) && \
		rm ~/.vimrc && \
		echo "$(orange)  --> Linking new vim configuration file$(reset)" &&\
		ln -s $(PWD)/vimrc ~/.vimrc; \
	fi;
	@echo "$(green)  --> Please run $(orange):PluginInstall$(green) from vim to terminate plugins installation$(reset)"
	@echo "$(blue)--> Done !$(reset)\n"

.PHONY: build_vim
build_vim:
	@if ! (( vim --version | head -n 1 | grep -q "8.1" )); then \
		echo "$(blue)Building Vim 8.1$(reset)" && \
		sudo apt-get install checkinstall libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
			libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git && \
		sudo apt-get remove vim vim-runtime gvim && \
		cd /tmp && \
			git clone https://github.com/vim/vim.git && \
			cd vim && \
			./configure --with-features=huge \
	    		--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
	    		--with-python3-config-dir=/usr/lib/python3.5/config-x86_64-linux-gnu/ \
            	--enable-multibyte \
	    		--enable-rubyinterp=yes \
	    		--enable-pythoninterp=yes \
	    		--enable-python3interp=yes \
	    		--enable-perlinterp=yes \
	    		--enable-luainterp=yes \
            	--enable-gui=gtk2 \
            	--enable-cscope \
	   			--prefix=/usr/local &&\
			make VIMRUNTIMEDIR=/usr/local/share/vim/vim81 &&\
			sudo checkinstall -y &&\
			sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1 && \
			sudo update-alternatives --set editor /usr/local/bin/vim && \
			sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1 && \
			sudo update-alternatives --set vi /usr/local/bin/vim && \
			sudo apt-mark hold vim && \
			cd /tmp && \
			sudo rm -rf vim && \
		echo "$(green)Vim 8.1 built successfully$(reset)"; \
	else \
		echo "$(green)Vim 8.1 already installed$(reset)"; \
	fi;


