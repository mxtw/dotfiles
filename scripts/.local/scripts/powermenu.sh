#!/bin/bash

CHOICE=$(cat <<EOF | fuzzel --dmenu
suspend
poweroff
reboot
EOF
)

case $CHOICE in
    suspend)
        loginctl suspend
        ;;
    poweroff)
        loginctl poweroff
        ;;
    reboot)
        loginctl reboot
        ;;
esac
