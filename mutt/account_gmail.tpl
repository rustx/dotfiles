unmailboxes *

# set pgp_sign_as USER_EMAIL

# SMTP credentials
set smtp_url = "smtp://USER_EMAIL@smtp.gmail.com:587/"
set smtp_pass = "USER_PASS"

# SMTP settings
set use_envelope_from = yes
set from = "USER_EMAIL"
set realname = "USER_NAME"

# IMAP credentials
set imap_user = "USER_EMAIL"
set imap_pass = "USER_PASS"

# IMAP settings
set folder = "imaps://USER_EMAIL@imap.gmail.com:993"
set spoolfile="imaps://USER_EMAIL@imap.gmail.com:993/INBOX"
set postponed="+[Gmail]/Drafts"
set trash = "+Trash"
set record = "+[Gmail]/Sent Mail"

# Global settings
set header_cache = ~/.mutt/accounts/USER_NAME.GMAIL_DOMAIN/cache/headers
set message_cachedir = ~/.mutt/accounts/USER_NAME.GMAIL_DOMAIN/cache/bodies
set certificate_file = ~/.mutt/accounts/USER_NAME.GMAIL_DOMAIN/certificates

mailboxes ! "+[Gmail]/All Mail" "=[Gmail]/Important" "=[Gmail]/Sent Mail" "=[Gmail]/Trash" "=[Gmail]/Spam"

# vim: ft=muttrc
