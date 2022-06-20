#!/bin/bash

# IMPORTS:
#   out
#   USER

out '[.] Installing display manager.'

sudo -u $USER yay -S ly

systemctl enable ly

# TODO modify systemd ly.service & ly's config.ini

out '[+] DM installed.'
