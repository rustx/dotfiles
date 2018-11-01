unmailboxes *

# PGP Settings
set pgp_use_gpg_agent = yes
set pgp_timeout = 60
set pgp_sign_as = USER_EMAIL
set crypt_autosign = yes
set crypt_replyencrypt = yes

# SMTP credentials
set smtp_url = "smtp://USER_EMAIL@smtp-mail.outlook.com:587/"
set smtp_pass = "USER_PASS"

# SMTP settings
set use_envelope_from = yes
set from = "USER_EMAIL"
set realname = "USER_NAME"

# IMAP credentials
set imap_user = "USER_EMAIL"
set imap_pass = "USER_PASS"

# IMAP settings
set folder = "imaps://USER_EMAIL@imap-mail.outlook.com:993"
set spoolfile="imaps://USER_EMAIL@imap-mail.outlook.com:993/INBOX"
set postponed="+Drafts"
set trash = "+Trash"
set record = "+Éléments envoyés"

# Global settings
set header_cache = ~/.mutt/accounts/USER_NAME.OUTLOOK_DOMAIN/cache/headers
set message_cachedir = ~/.mutt/accounts/USER_NAME.OUTLOOK_DOMAIN/cache/bodies
set certificate_file = ~/.mutt/accounts/USER_NAME.OUTLOOK_DOMAIN/certificates

mailboxes ! "=INBOX" "=Éléments envoyés" "=Courrier indésirable" "=Trash"

# vim: ft=muttrc
