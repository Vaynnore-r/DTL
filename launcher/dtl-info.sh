#!/bin/bash
echo "DTL Beta "
echo
read -p "Go back to DTL? (y/n) :" answer </dev/tty
if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
    ~/.DTL/launcher/launcher.sh
else
    echo "Invalid Key"
    sleep 1
    clear
    exec "$0" "$@"
fi