# Build and configure weechat

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

all: weechat

.PHONY: weechat
weechat:
	@echo "$(blue)Weechat $(reset)"
	@echo "$(blue) Checking weechat directories$(reset)"
	@if ! (( test -d ~/.weechat )); then \
		mkdir -p ~/.weechat && \
		echo "$(green)   --> Directory ~/.weechat created successfully$(reset)"; \
	else \
		echo "$(red)  --> Directory ~/.weechat already exists$(reset)"; \
	fi;
	@echo "$(blue) Checking weechat configuration file$(reset)"
	@if ! (( test -f ~/.weechat/irc.conf )); then \
		echo "$(orange)  --> No old weechat configuration file, all clean$(reset)";\
	else \
		echo "$(green)  --> Moving old configuration file to ~/.weechat/irc.conf.$(NOW)$(reset)" &&\
		cp ~/.weechat/irc.conf ~/.weechat/irc.conf.$(NOW) && \
		rm ~/.weechat/irc.conf; \
	fi;
	@echo "$(green)  --> Generating new weechat configuration file$(reset)" &&\
	read -p '  --> What is your irc nickname ? : ' nick &&\
	read -p '  --> Which channels would you like to join ? : ' chan &&\
	cat $(PWD)/irc.conf.tpl |\
		sed "s/NICK/$$nick/g" |\
		sed "s/CHAN/$$chan/g"\
	>~/.weechat/irc.conf;
	@echo "$(orange)  --> Weechat configuration file generated successfully !$(reset)"
	@echo "$(blue)  --> Now launch those commands in weechat to get ready : $(reset)"
	@echo "$(white)\t/secure passphrase this is my passphrase$(reset)"
	@echo "$(white)\t/secure set freenode mypassword$(reset)"
	@echo "$(white)\t/set irc.server.freenode.sasl_password \"${sec.data.freenode}\"$(reset)"
	@echo "$(blue)--> Done !$(reset)\n"

