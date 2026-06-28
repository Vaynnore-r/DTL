#!/bin/bash
echo "DTL Beta "
echo
read -p "Press "e" to go back" answer </dev/tty
if [[ "$answer" =~ ^[Ee](es)?$ ]]; then
    ~/DTL/launcher/launcher.sh
else
    echo "Invalid Key"
    sleep 1
    exec "$0" "$@"
fi