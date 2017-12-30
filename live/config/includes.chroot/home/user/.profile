# globally set in /etc/profile
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# load persistent .profile file
PERSISTENTFILE="/p/.profile"
if [ -f $PERSISTENTFILE ]; then
   echo "Executing persistent .profile file..."
   source $PERSISTENTFILE
fi

if ! pidof X &>/dev/null; then
    while true; do
        startx
        sleep 3
    done
else
    echo "X already running. Just run login shell."
fi

