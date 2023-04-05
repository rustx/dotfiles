# Configure rofi

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

all: rofi

.PHONY: rofi
rofi:
	@echo "$(blue)Rofi $(reset)"
	@echo "$(blue) Checking rofi directories$(reset)"
	@if ! (( test -d ~/.config/rofi)); then \
		mkdir -p ~/.config/rofi && \
		echo "$(green)   --> Directory ~/.config/rofi created successfully$(reset)"; \
	else \
		echo "$(green)   --> Directory ~/.config/rofi already exists$(reset)"; \
	fi;
	@echo "$(blue) Checking rofi configuration file"
	@if ! (( test  -f ~/.config/rofi/config.rasi )); then \
		echo "$(green)  --> No old rofi configuration file, all clean$(reset)" &&\
		echo "$(orange)  --> Linking new rofi configuration file$(reset)" &&\
		ln -s $(PWD)/config.rasi ~/.config/rofi/config.rasi; \
	else \
		echo "$(green)  --> Moving old configuration file to ~/.config/rofi/config.rasi.$(NOW)$(reset)" &&\
		cp ~/.config/rofi/config.rasi ~/.config/rofi/config.rasi.$(NOW) && \
		rm ~/.config/rofi/config.rasi && \
		echo "$(orange)  --> Linking new rofi configuration file$(reset)" &&\
		ln -s $(PWD)/config.rasi ~/.config/rofi/config.rasi; \
	fi;
	@echo "$(blue)--> Done !$(reset)\n"

