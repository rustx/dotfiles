# Build and configure mutt

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


all: build_mutt mutt encrypt_mutt

.PHONY: build_mutt
build_mutt:
	@if ! ((  mutt -v | head -n 1 | grep -q "Mutt 1.9.5" )); then \
		echo "$(blue)Building Mutt$(reset)" && \
		cd /tmp && \
			wget -c ftp://ftp.mutt.org/pub/mutt/mutt-1.9.5.tar.gz && \
			tar -xvf mutt-1.9.5.tar.gz && \
			rm mutt-1.9.5.tar.gz && \
			cd mutt-1.9.5/ && \
			sudo apt-get install -y  build-essential libtokyocabinet-dev libncurses5-dev libncursesw5-dev libsasl2-dev libssl-dev && \
			./configure --prefix=/usr                     \
					--sysconfdir=/etc                         \
					--with-docdir=/usr/share/doc/mutt-1.9.5   \
					--with-ssl                                \
					--with-sasl                               \
					--with-tokyo-cabinet                      \
					--enable-external-dotlock                 \
					--enable-pop                              \
					--enable-imap                             \
					--enable-smtp                             \
					--enable-hcache                           \
					--enable-sidebar                       && \
			sudo make && \
			sudo make install && \
			cd /tmp && \
			sudo rm -r ./mutt-1.9.5 && \
		echo "$(green)Mutt built successfully$(reset)" && \
		echo "$(orange)Updating gpg-agent configuration$(reset)" && \
		echo "allow-loopback-pinentry\npinentry-program /usr/bin/pinentry-x11\n"> ~/.gnupg/gpg-agent.conf && gpg-connect-agent /bye && \
		echo "$(green)Agent reloaded successfully !$(reset)";\
	else \
		echo "$(green)Mutt 1.9.5 is already installed$(reset)"; \
	fi;

.PHONY: mutt
mutt:
	@echo "$(blue)Mutt $(reset)"
	@echo "$(blue) Checking mutt directories$(reset)"
	@if ! (( test -d ~/.mutt )); then \
		mkdir -p ~/.mutt && \
		echo "$(green)   --> Directory ~/.mutt/accounts created successfully$(reset)"; \
	else \
		echo "$(red)  --> Directory ~/.mutt/accounts already exists$(reset)"; \
	fi;
	@echo "$(blue) Checking mutt configuration file$(reset)"
	@if ! (( test  -f ~/.muttrc )); then \
		echo "$(green)  --> No old mutt configuration file, all clean$(reset)"; \
	else \
		echo "$(green)  --> Moving old configuration file to ~/.muttrc.$(NOW)$(reset)" &&\
		cp ~/.muttrc ~/.muttrc.$(NOW) && \
		rm ~/.muttrc && \
		echo "$(orange)  --> Old mutt configuration file moved successfully !$(reset)"; \
	fi;
	@read -p '  --> How many accounts would you like to configure ? : ' account_number; \
	for account in $$(seq 1 $$account_number); do \
		echo "\n$(green)  --> Preparing account $$account/$$account_number$(reset)\n" && \
		read -p '  --> What is your account type (gmail/outlook/imap) : ' account_type; \
		if [ "$$account_type" = "gmail" ]; then \
			read -p '  --> What is your user_email : ' user_email &&\
			read -p '  --> What is your user_name : ' user_name &&\
			read -p '  --> What is your gmail_domain : ' gmail_domain &&\
			read -p '  --> What is your user_pass : ' user_pass  &&\
			echo && \
			if ! (( test -d ~/.mutt/accounts/$$user_name.$$gmail_domain )); then \
				mkdir -p ~/.mutt/accounts/$$user_name.$$gmail_domain/cache/bodies ; \
			fi; \
			cat $(PWD)/account_$$account_type.tpl |\
				sed "s/USER_EMAIL/$$user_email/g" |\
				sed "s/USER_PASS/$$user_pass/g" |\
				sed "s/USER_NAME/$$user_name/g" |\
				sed "s/GMAIL_DOMAIN/$$gmail_domain/g"\
			>~/.mutt/accounts/$$user_name.$$gmail_domain/settings; \
			if [ $$account = "1" ]; then \
				echo "$(orange)  --> This account will be the default account$(reset)" &&\
				cat $(PWD)/muttrc.tpl |\
					sed "s#DEFAULT_ACCOUNT#DEFAULT_ACCOUNT\nsource \"gpg2 -d ~/.mutt/accounts/$$user_name.$$gmail_domain/settings.gpg |\"#g" |\
					sed "s#FOLDER_HOOK#FOLDER_HOOK\nfolder-hook '$$user_name.$$gmail_domain' 'source \"gpg2 -d ~/.mutt/accounts/$$user_name.$$gmail_domain/settings.gpg |\"'#g" |\
					sed "s#MACRO_HOOK#MACRO_HOOK\nmacro index <f$$(( $$account + 1 ))> '<sync-mailbox><change-folder>imaps://$$user_email@imap.gmail.com:993/<enter>'#g"\
				>~/.muttrc; \
			else \
				sed -i \
					-e "s#FOLDER_HOOK#FOLDER_HOOK\nfolder-hook '$$user_name.$$gmail_domain' 'source \"gpg2 -d ~/.mutt/accounts/$$user_name.$$gmail_domain/settings.gpg |\"'#g" \
					-e "s#MACRO_HOOK#MACRO_HOOK\nmacro index <f$$(( $$account + 1 ))> '<sync-mailbox><change-folder>imaps://$$user_email@imap.gmail.com:993/<enter>'#g"\
				~/.muttrc; \
			fi; \
		elif [ $$account_type = "outlook" ]; then \
			read -p '  --> What is your user_email : ' user_email &&\
			read -p '  --> What is your user_name : ' user_name &&\
			read -p '  --> What is your outlook_domain : ' outlook_domain &&\
			read -p '  --> What is your user_pass : ' user_pass &&\
			echo && \
			if ! (( test -d ~/.mutt/accounts/$$user_name.$$outlook_domain )); then \
				mkdir -p ~/.mutt/accounts/$$user_name.$$outlook_domain/cache/bodies ; \
			fi ; \
			cat $(PWD)/account_$$account_type.tpl |\
				sed "s/USER_EMAIL/$$user_email/g" |\
				sed "s/USER_PASS/$$user_pass/g" |\
				sed "s/USER_NAME/$$user_name/g" |\
				sed "s/OUTLOOK_DOMAIN/$$outlook_domain/g"\
			>~/.mutt/accounts/$$user_name.$$outlook_domain/settings; \
			if [ $$account = "1" ]; then \
				echo "$(orange)  --> This account will be the default account$(reset)" &&\
				cat $(PWD)/muttrc.tpl |\
					sed "s#DEFAULT_ACCOUNT#DEFAULT_ACCOUNT\nsource \"gpg2 -d ~/.mutt/accounts/$$user_name.$$outlook_domain/settings.gpg |\"#g" |\
					sed "s#FOLDER_HOOK#FOLDER_HOOK\nfolder-hook '$$user_name.$$outlook_domain' 'source \"gpg2 -d ~/.mutt/accounts/$$user_name.$$outlook_domain/settings.gpg |\"'#g" |\
					sed "s#MACRO_HOOK#MACRO_HOOK\nmacro index <f$$(( $$account + 1 ))> '<sync-mailbox><change-folder>imaps://$$user_email@imap-mail.outlook.com:993/<enter>'#g"\
				>~/.muttrc; \
			else \
				sed -i \
					-e "s#FOLDER_HOOK#FOLDER_HOOK\nfolder-hook '$$user_name.$$outlook_domain' 'source \"gpg2 -d ~/.mutt/accounts/$$user_name.$$outlook_domain/settings.gpg |\"'#g" \
					-e "s#MACRO_HOOK#MACRO_HOOK\nmacro index <f$$(( $$account + 1 ))> '<sync-mailbox><change-folder>imaps://$$user_email@imap-mail.outlook.com:993/<enter>'#g"\
				~/.muttrc; \
			fi; \
		elif [ $$account_type = "imap" ]; then \
			read -p '  --> What is your user_email : ' user_email &&\
			read -p '  --> What is your user_name : ' user_name &&\
			read -p '  --> What is your imap_domain : ' imap_domain &&\
			read -p '  --> What is your smtp_host : ' smtp_host &&\
			read -p '  --> What is your imap_host : ' imap_host &&\
			read -p '  --> What is your user_pass : '  user_pass &&\
			echo && \
			if ! (( test -d ~/.mutt/accounts/$$user_name.$$imap_domain )); then \
				mkdir -p ~/.mutt/accounts/$$user_name.$$imap_domain/cache/bodies ; \
			fi; \
			cat $(PWD)/account_$$account_type.tpl |\
				sed "s/USER_EMAIL/$$user_email/g" |\
				sed "s/USER_PASS/$$user_pass/g" |\
				sed "s/USER_NAME/$$user_name/g" |\
				sed "s/SMTP_HOST/$$smtp_host/g" |\
				sed "s/IMAP_HOST/$$imap_host/g" |\
				sed "s/IMAP_DOMAIN/$$imap_domain/g"\
			>~/.mutt/accounts/$$user_name.$$imap_domain/settings; \
			if [ $$account = "1" ]; then \
				echo "$(orange)  --> This account will be the default account$(reset)" &&\
				cat $(PWD)/muttrc.tpl |\
					sed "s#DEFAULT_ACCOUNT#DEFAULT_ACCOUNT\nsource \"gpg2 -d ~/.mutt/accounts/$$user_name.$$imap_domain/settings.gpg |\"#g" |\
					sed "s#FOLDER_HOOK#FOLDER_HOOK\nfolder-hook '$$user_name.$$imap_domain' 'source \"gpg2 -d ~/.mutt/accounts/$$user_name.$$imap_domain/settings.gpg |\"'#g" |\
					sed "s#MACRO_HOOK#MACRO_HOOK\nmacro index <f$$(( $$account + 1 ))> '<sync-mailbox><change-folder>imaps://$$user_email@$$imap_host:993/<enter>'#g"\
				>~/.muttrc; \
			else \
				sed -i \
					-e "s#FOLDER_HOOK#FOLDER_HOOK\nfolder-hook '$$user_name.$$imap_domain' 'source \"gpg2 -d ~/.mutt/accounts/$$user_name.$$imap_domain/settings.gpg |\"'#g" \
					-e "s#MACRO_HOOK#MACRO_HOOK\nmacro index <f$$(( $$account + 1 ))> '<sync-mailbox><change-folder>imaps://$$user_email@$$imap_host:993/<enter>'#g"\
				~/.muttrc; \
			fi; \
		else \
			echo "$(red)  --> Sorry, not undestood$(reset)" && exit 1; \
		fi; \
	done
	@echo "$(blue)--> Mutt setup done !$(reset)\n"

.PHONY: decrypt_mutt
decrypt_mutt:
	@echo "$(blue)Decrypt mutt$(reset)"
	@for accounts in ~/.mutt/accounts/*; do \
		echo "$(orange)  --> Decrypting $$accounts$(reset)" &&\
		gpg2 -d $$accounts/settings.gpg > $$accounts/settings &&\
		echo "$(green)  --> Decrypting done successfully$(reset)"; \
	done

.PHONY: encrypt_mutt
encrypt_mutt:
	@echo "$(blue)Encrypt mutt$(reset)"
	@read -p '$(blue)  --> What is your PGP ID ? : $(reset)' pgp_id; \
	for accounts in ~/.mutt/accounts/*; do \
		echo "$(orange)  --> Encrypting $$accounts$(reset)" &&\
		gpg2 -r $$pgp_id -e $$accounts/settings && \
		rm $$accounts/settings && \
		echo "$(green)  --> Encrypting done successfully$(reset)"; \
	done

