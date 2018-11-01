# Build and configure powerline

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

all: build_powerline powerline

.PHONY: build_powerline
build_powerline:
	@echo "$(blue)Building powerline$(reset)"
	@if ! (( pip list -q powerline-shell 2>/dev/null)); then \
		pip install --user -q powerline-shell; \
	fi
	@if ! (( pip list -q powerline-status 2>/dev/null )); then \
		pip install --user -q powerline-status; \
	fi
	@echo "$(green)  --> Updating font-cache$(reset)"
	@fc-cache -f ~/.local/share/fonts &>/dev/null && \
	echo "$(blue)--> Done !\n$(reset)"

.PHONY: powerline
powerline:
	@echo "$(blue)Configuration for powerline $(reset)"
	@echo "$(blue) Checking powerline directories$(reset)"
	@if ! ((  test -d ~/.config/powerline-shell )); then \
		mkdir -p ~/.config/powerline-shell && \
		echo "$(green)  --> Directory $$d created successfully$(reset)"; \
	else \
		echo "$(red)  --> Directory $$d already exists$(reset)"; \
	fi;
	@echo "$(blue) Checking powerline configuration file$(reset)"
	@if ! ((  test -f ~/.config/powerline-shell/config.json )); then \
		echo "$(green)  --> No old powerline configuration file, all clean$(reset)" &&\
		echo "$(orange)  --> Linking new powerline configuration file$(reset)" &&\
		ln -s $(PWD)/powerline-shell.json ~/.config/powerline-shell/config.json; \
	 else \
		echo "$(green)  --> Moving old configuration file to ~/.config/powerline-shell/config.json.$(NOW)$(reset)" &&\
		cp ~/.config/powerline-shell/config.json ~/.config/powerline-shell/config.json.$(NOW) &&\
		rm ~/.config/powerline-shell/config.json && \
		echo "$(orange)  --> Linking new powerline configuration file$(reset)" &&\
		ln -s $(PWD)/powerline-shell.json ~/.config/powerline-shell/config.json; \
	fi;
	@if !  (( test -f ~/.config/powerline-shell/theme.py )); then \
		echo "$(green)  --> No old powerline theme file, all clean$(reset)" &&\
		read -p '  --> What theme would you like to link ($(shell ls *.py | sed "s/.py//g")) ? : ' theme ;\
		echo "$(orange)  --> Linking new powerline theme file$(reset)" &&\
		ln -s $(PWD)/$$theme.py ~/.config/powerline-shell/theme.py; \
	else \
		echo "$(green)  --> Moving old theme file to ~/.config/powerline-shell/theme.py.$(NOW)$(reset)" &&\
		read -p '  --> What theme would you like to link ($(shell ls *.py | sed "s/.py//g")) ? : ' theme ;\
		cp ~/.config/powerline-shell/theme.py ~/.config/powerline-shell/theme.py.$(NOW) &&\
		rm ~/.config/powerline-shell/theme.py && \
		echo "$(orange)  --> Linking new powerline theme file$(reset)" &&\
		ln -s $(PWD)/$$theme.py ~/.config/powerline-shell/theme.py; \
	fi;
	@echo "$(blue)--> Done !$(reset)\n"

