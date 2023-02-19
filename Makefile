###
#
# This Makefile links all dotfiles in user home.
#
###

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

help:
	@echo "$(green)#####\t\t\t\tDotfiles Builder\t\t\t\t#####$(reset)\n"
	@echo "$(blue)\t\tTargets $(reset)\n\n"
	@echo "\t\t$(orange)all$(reset)\t\t\t- Build all config files\n"
	@echo "\t\t$(orange)vim$(reset)\t\t\t- Build vim and link config files"
	@echo "\t\t$(orange)powerline$(reset)\t\t- Build and link  powerline config files"
	@echo "\t\t$(orange)weechat$(reset)\t\t\t- Link weechat config files"
	@echo "\t\t$(orange)mutt$(reset)\t\t\t- Build mutt and link config files"
	@echo "\t\t$(orange)mocp$(reset)\t\t\t- Link mocp config files"
	@echo "\t\t$(orange)alacritty$(reset)\t\t  Link alacritty onfig files"
	@echo "\t\t$(orange)xresources$(reset)\t\t- Link xresources config files\n"
	@echo "\t\t$(orange)clean$(reset)\t\t\t- Clean backup files"
	@echo "\t\t$(orange)help$(reset)\t\t\t- Shows this help"
	@echo

all: vim powerline weechat mutt mocp xresources

*:
	@$(MAKE) -s -C $(@)

clean:
	@echo "$(blue)Cleaning backup files$(reset)"
	@for file in \
		~/.vimrc.* \
		~/.config/powerline-shell/config.json.* \
		~/.config/powerline-shell/theme.py.* \
		~/.weechat/irc.conf.* \
		~/.muttrc.* \
		~/.mutt/accounts/*/settings \
		~/.moc/config.* \
		~/.config/alacritty/alacritty.yml.* \
		~/.moc/themes/active_theme.* \
		~/.Xdefaults.* \
		~/.xresources/theme.*; do \
		if test -f $$file; then \
			echo "$(orange)  --> Removing $$file$(reset)" && \
			rm $$file; \
		fi; \
	done && \
	echo "$(green)Cleaning done successfully !$(reset)"

.PHONY: vim powerline weechat mocp mutt xresources clean
