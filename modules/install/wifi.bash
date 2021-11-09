#!/bin/bash

if $wifi; then
    out '[.] Connecting to WiFi.'
    iwctl --passphrase $WPASS station wlan0 connect $WSSID
fi
