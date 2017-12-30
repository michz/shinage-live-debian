#!/bin/bash

# load persistent before-wm.xsession file
PERSISTENTFILE="/p/before-wm.xsession"
if [ -f $PERSISTENTFILE ]; then
   echo "Executing persistent before-wm.xsession file..."
   source $PERSISTENTFILE
fi

# run window manager
/usr/bin/matchbox-window-manager  -use_titlebar no -use_cursor no &
sleep 1

# load persistent after-wm.xsession file
PERSISTENTFILE="/p/after-wm.xsession"
if [ -f $PERSISTENTFILE ]; then
   echo "Executing persistent after-wm.xsession file..."
   source $PERSISTENTFILE
fi


# run browser
/usr/local/bin/run-browser.sh

