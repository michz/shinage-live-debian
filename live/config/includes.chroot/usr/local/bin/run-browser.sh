#! /bin/bash
#
# run-browser.sh
# Copyright (C) 2016 Michael Zapf <michi.zapf@mztx.de>
#


URL=http://localhost/

if [ -z "$CHROMIUMPARAMETERS" ]; then
    CHROMIUMPARAMETERS=""
fi

sed -i 's/"exited_cleanly": false/"exited_cleanly": true/' ~/.config/chromium/Default/Preferences


unclutter &


xset s off
xset -dpms
xset s noblank

chromium --noerrdialogs --incognito --disable-translate \
    --disable-translate-new-ux --disk-cache-size=0 \
    --no-first-run --force-device-scale-factor=1 \
    --user-data-dir=/tmp/chromium/ --disk-cache-dir=/tmp/chromium/ \
    --disk-cache-size=$((1024 * 1024)) --disable-java --disable-plugins $CHROMIUMPARAMETERS \
    --kiosk $URL



