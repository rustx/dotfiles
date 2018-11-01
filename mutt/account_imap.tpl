unmailboxes *

# SMTP credentials
set smtp_url = "smtps://USER_EMAIL@SMTP_HOST:465/"
set smtp_pass = "USER_PASS"

# SMTP settings
set use_envelope_from = yes
set from = "USER_EMAIL"
set realname = "USER_NAME"

# IMAP CREDENTIALS
set imap_user = "USER_EMAIL"
set imap_pass = "USER_PASS"

# IMAP settings
set folder = "imaps://USER_EMAIL@IMAP_HOST:993"
set spoolfile = "imaps://USER_EMAIL@IMAP_HOST:993/INBOX"
set postponed = "+Drafts"
set trash = "+Trash"
set record = "+Sent"

# Global settings
set header_cache = ~/.mutt/accounts/USER_NAME.IMAP_DOMAIN/cache/headers
set message_cachedir = ~/.mutt/accounts/USER_NAME.IMAP_DOMAIN/cache/bodies
set certificate_file = ~/.mutt/accounts/USER_NAME.IMAP_DOMAIN/certificates

# PGP configuration
set pgp_use_gpg_agent = yes
set pgp_sign_as = USER_EMAIL
set pgp_timeout = 60
set crypt_autosign = yes
set crypt_replyencrypt = yes

mailboxes !  "=INBOX" "=Sent" "=Trash" "=Junk"

# vim: ft=muttrc
