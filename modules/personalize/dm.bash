#!/bin/bash

# IMPORTS:
#   out

out '[.] Installing display manager.'

yay -S ly

sudo systemctl enable ly

# TODO modify systemd ly.service & ly's config.ini

out '[+] DM installed.'
