#!/bin/bash

# IMPORTS:
#   WSSID
#   WPASS

# EXPORTS:
#   enable_wifi : Set if WiFi is required

enable_wifi=yes

out '[.] Connecting to WiFi.'
iwctl --passphrase $WPASS station wlan0 connect $WSSID
sleep 5
