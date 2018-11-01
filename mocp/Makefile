# Configure mocp

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

all: mocp

.PHONY: mocp
mocp:
	@echo "$(blue)Mocp $(reset)"
	@echo "$(blue) Checking mocp directories$(reset)"
	@if ! (( test -d ~/.moc/themes )); then \
		mkdir -p ~/.moc/themes && \
		echo "$(green)   --> Directory ~/.moc/themes created successfully$(reset)"; \
	else \
		echo "$(green)   --> Directory ~/.moc/themes already exists$(reset)"; \
	fi;
	@echo "$(blue) Checking mocp theme$(reset)"
	@if ! ((  test -f ~/.moc/themes/active_theme )); then \
		read -p '  --> What theme would you like to link ($(shell ls |grep "theme_" | sed "s/theme_//g")) ? : ' color && \
		echo "$(orange)  --> Linking new mocp $$color_theme file$(reset)" && \
		ln -s $(PWD)/theme_$$color ~/.moc/themes/active_theme ; \
	else \
		echo "$(green)  --> Moving old mocp theme file to ~/.moc/theme/$$theme_theme.$(NOW)$(reset)" &&\
		cp ~/.moc/themes/active_theme ~/.moc/themes/active_theme.$(NOW) && \
		rm ~/.moc/themes/active_theme && \
		read -p '  --> What theme would you like to link ($(shell ls |grep "theme_" | sed "s/theme_//g")) ? : ' color && \
		echo "$(orange)  --> Linking new mocp theme file$(reset)" && \
		ln -s $(PWD)/theme_$$color ~/.moc/themes/active_theme; \
	fi;
	@echo "$(blue) Checking mocp configuration file"
	@if ! (( test  -f ~/.moc/config )); then \
		echo "$(green)  --> No old mocp configuration file, all clean$(reset)" &&\
		echo "$(orange)  --> Linking new mocp configuration file$(reset)" &&\
		ln -s $(PWD)/config ~/.moc/config; \
	else \
		echo "$(green)  --> Moving old configuration file to ~/.moc/config.$(NOW)$(reset)" &&\
		cp ~/.moc/config ~/.moc/config.$(NOW) && \
		rm ~/.moc/config && \
		echo "$(orange)  --> Linking new mocp configuration file$(reset)" &&\
		ln -s $(PWD)/config ~/.moc/config; \
	fi;
	@echo "$(blue)--> Done !$(reset)\n"


