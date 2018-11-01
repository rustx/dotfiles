# Configure xresources

PWD		:= $(shell pwd)
NOW     := $(shell date +%Y-%m-%d-%H-%M-%S)

reset   := $(shell tput sgr0)
red     := $(shell tput setaf 1)
green   := $(shell tput setaf 2)
orange  := $(shell tput setaf 3)
blue    := $(shell tput setaf 4)
magenta := $(shell tput setaf 5)
cyan    := $(shell tput setaf 6)
white   := $(shell tput setaf 7)

all: xresources

.PHONY: xresources
xresources:
	@echo "$(blue)Xresources $(reset)"
	@echo "$(blue) Checking Xdefaults directories$(reset)"
	@if ! ((  test -d ~/.xresources )); then \
		mkdir -p ~/.xresources && \
		read -p '  --> What theme would you like to link ($(shell ls ../colors |grep -Ev "palette|dircolors")) ? : ' theme ;\
		ln -s $(PWD)/../colors/$$theme ~/.xresources/theme && \
		echo "$(green)  --> Theme $$theme linked successfully$(reset)"; \
	else \
		read -p '  --> What theme would you like to link ($(shell ls ../colors |grep -Ev "palette|dircolors")) ? : ' theme ;\
		cp ~/.xresources/theme ~/.xresources/theme.$(NOW) && \
		rm ~/.xresources/theme && \
		ln -s $(PWD)/../colors/$$theme ~/.xresources/theme && \
		echo "$(green)  --> Theme $$theme linked successfully$(reset)"; \
	fi;
	@echo "$(blue) Checking xresources configuration file$(reset)"
	@if ! (( test -f ~/.Xdefaults )); then \
		echo "$(green)  --> No old xresources configuration file, all clean$(reset)" &&\
		echo "$(orange)  --> Linking new xresources configuration file$(reset)" &&\
		ln -s $(PWD)/Xdefaults ~/.Xdefaults && \
		xrdb -merge ~/.Xdefaults; \
	else \
		echo "$(green)  --> Moving old configuration file to ~/.Xdefaults.$(NOW)$(reset)" &&\
		cp ~/.Xdefaults ~/.Xdefaults.$(NOW) && \
		rm ~/.Xdefaults && \
		echo "$(orange)  --> Linking new xresources configuration file$(reset)" &&\
		ln -s $(PWD)/Xdefaults ~/.Xdefaults && \
		xrdb -merge ~/.Xdefaults; \
	fi;
	@echo "$(blue)--> Done !$(reset)\n"


