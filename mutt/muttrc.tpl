# Show version at startup
push <show-version>

# Base Config
set text_flowed = yes
set pgp_use_gpg_agent = yes
set pgp_verify_sig
set smileys="(>From )|(:[-^]?[][)(><}{|/DP])"
set sort = threads
set rfc2047_parameters = yes

#DEFAULT_ACCOUNT

#FOLDER_HOOK

#MACRO_HOOK

# Fetch mail shortcut
bind index G imap-fetch-mail

# SSL hardening
set ssl_usesystemcerts = no
set ssl_force_tls = yes
set ssl_starttls = yes
set ssl_use_sslv3 = no
set ssl_use_tlsv1 = no
set ssl_use_tlsv1_1 = no
set ssl_use_tlsv1_2 = yes
set ssl_verify_dates = yes
set ssl_verify_host = yes

# IMAP defaults
set mail_check = 120
set timeout = 3600
set imap_keepalive = 300

# Date format
set date_format = "%A %d %b %Y à %H:%M:%S (%Z)"

# Email introduction
set attribution = "Le %d, %n a écrit :"
set forward_format = "[Fwd: %s]"
set forward_quote

# Editor
set edit_hdrs
auto_view text/html
set editor = "vim -c 'set spell spelllang=en,fr'"

# Colors
color normal color245 default                               # default
color attachment magenta default                            # attachments
color body cyan default "(ftp|http)://[^ ]+"                # point out URLs
color body brightgreen default [-a-z_0-9.]+@[-a-z_0-9.]+    # e-mail addresses
color bold brightblue default                               # boldface text
color error brightwhite red                                 # error messages
color hdrdefault brightblue default                         # default color of message header
color header brightgreen default ^(From):                   # From and Subject header
color header brightmagenta default ^(Subject):              # From and Subject header
color header brightyellow default ^(Date):                  # Date header
color header white default ^(In-Reply-To):                  # In-Reply-to header
color indicator black cyan                                  # indicator bar
color markers brightblue default                            # wrapped line markers (+)
color message black green                                   # status messages
color quoted yellow default                                 # quoted text, 1st quote level
color quoted1 green default                                 # quoted text, 2nd quote level
color quoted2 brightblue default                            # quoted text, 3rd quote level
color quoted3 blue default                                  # quoted text, 4th quoet level
color search black yellow                                   # matched search patterns in pager
color signature red default                                 # the signature (after sigdashes)
color status green black                                    # status lines
color tilde blue default                                    # ``~'' used to pad blank lines
color tree green default                                    # thread tree in the index menu
color underline brightgreen black                           # underlined text
color index color246  default ~A                            # all messages
color index color7 default ~O                               # old messages
color index color242 default ~Q                             # messages being replied to
color index color102 black ~P                               # messages from me
color index red default ~D                                  # deleted messages
color index magenta default ~T                              # tagged messages
color index brightwhite red ~F                              # flagged messages
color index brightyellow default ~N                         # new messages
color index yellow default ~U                               # unread messages
color index blue default ~S                                 # signed and verified

# PGP
color body  red default     "(BAD signature)"
color body  brightgreen default   "(Good signature)"
color body  green default   "^gpg: Good signature .*"
color body  blue default    "^gpg: "
color body  red default     "^gpg: BAD signature from.*"
mono  body  bold            "^gpg: Good signature"
mono  body  bold            "^gpg: BAD signature from.*"

# Locale setup
set charset = "utf-8"

set pager_index_lines = 7
set pager_stop
set indent_string = '> '

# Sidebar setup, default not visible
set sidebar_width=30
set sidebar_visible=yes
set sidebar_folder_indent = yes
set sidebar_short_path = yes

# New email folder
color sidebar_new yellow default

# Ctrl-n, Ctrl-p to select next, prev folder
# Ctrl-o to open selected folder
bind index \CP sidebar-prev
bind index \CN sidebar-next
bind index \CO sidebar-open
bind pager \CP sidebar-prev
bind pager \CN sidebar-next
bind pager \CO sidebar-open

# For documentation purposes. See below.
# sidebar-scroll-up
# sidebar-scroll-down

# Toggle sidebar visibility
macro index b '<enter-command>toggle sidebar_visible<enter>'
macro pager b '<enter-command>toggle sidebar_visible<enter>'

# Remap bounce-message function to "B"
bind index B bounce-message

# Search in messages bodies
macro index \eb "<search>~b " "search in message bodies"

# Follow links
macro index \cb |urlview\n
macro pager \cb |urlview\n

# PGG settings
set pgp_decode_command="gpg2 %?p?--passphrase-fd 0? --no-verbose --batch --output - %f"
set pgp_verify_command="gpg2 --no-verbose --batch --output - --verify %s %f"
set pgp_decrypt_command="gpg2 --passphrase-fd 0 --no-verbose --batch --output - %f"
set pgp_sign_command="gpg2 --no-verbose --batch --output - --passphrase-fd 0 --armor --detach-sign --textmode %?a?-u %a? %f"
set pgp_clearsign_command="gpg2 --no-verbose --batch --output - --passphrase-fd 0 --armor --textmode --clearsign %?a?-u %a? %f"
set pgp_encrypt_only_command="pgpewrap gpg2 --batch --quiet --no-verbose --output - --encrypt --textmode --armor --always-trust --encrypt-to 0xC9C40C31 -- -r %r -- %f"
set pgp_encrypt_sign_command="pgpewrap gpg2 --passphrase-fd 0 --batch --quiet --no-verbose --textmode --output - --encrypt --sign %?a?-u %a? --armor --always-trust --encrypt-to 0xC9C40C31 -- -r %r -- %f"
set pgp_import_command="gpg2 --no-verbose --import -v %f"
set pgp_export_command="gpg2 --no-verbose --export --armor %r"
set pgp_verify_key_command="gpg2 --no-verbose --batch --fingerprint --check-sigs %r"
set pgp_list_pubring_command="gpg2 --no-verbose --batch --with-colons --list-keys %r"
set pgp_list_secring_command="gpg2 --no-verbose --batch --with-colons --list-secret-keys %r"


# vim: ft=muttrc
