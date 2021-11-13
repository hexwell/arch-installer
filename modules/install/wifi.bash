#!/bin/bash

out '[.] Connecting to WiFi.'
iwctl --passphrase "$WPASS" station wlan0 connect "$WSSID"
sleep 5
