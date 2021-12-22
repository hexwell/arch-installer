#!/bin/bash

# IMPORTS:
#   WSSID
#   WPASS

# EXPORTS:
#   enable_wifi : Set if WiFi is required

enable_wifi=true

out '[.] Connecting to WiFi.'
iwctl --passphrase "$WPASS" station wlan0 connect "$WSSID"
sleep 5
