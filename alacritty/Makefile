# Configure alacritty

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

all: alacritty

.PHONY: alacritty
alacritty:
	@echo "$(blue)Mocp $(reset)"
	@echo "$(blue) Checking alacritty directories$(reset)"
	@if ! (( test -d ~/.config/alacritty)); then \
		mkdir -p ~/.config/alacritty && \
		echo "$(green)   --> Directory ~/.config/alacritty/g created successfully$(reset)"; \
	else \
		echo "$(green)   --> Directory ~/.config/alacritty already exists$(reset)"; \
	fi;
	@echo "$(blue) Checking alacritty configuration file"
	@if ! (( test  -f ~/.config/alacritty/alacritty.yml/g )); then \
		echo "$(green)  --> No old alacritty configuration file, all clean$(reset)" &&\
		echo "$(orange)  --> Linking new alacritty configuration file$(reset)" &&\
		ln -s $(PWD)/config ~/.config/alacritty/alacritty.yml/g; \
	else \
		echo "$(green)  --> Moving old configuration file to ~/.config/alacritty/alacritty.yml/g.$(NOW)$(reset)" &&\
		cp ~/.config/alacritty/alacritty.yml/g ~/.config/alaritty/alacritty.yml.$(NOW) && \
		rm ~/.config/alacritty/alacritty.yml/g && \
		echo "$(orange)  --> Linking new alacritty configuration file$(reset)" &&\
		ln -s $(PWD)/config ~/.config/alacritty/alacritty.yml/g; \
	fi;
	@echo "$(blue)--> Done !$(reset)\n"

