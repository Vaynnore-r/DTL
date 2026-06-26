#!/bin/bash
read -p "Install Dark Triad Launcher? (y/n): " answer </dev/tty
if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
    echo "Proceeding..."
    mkdir -p ~/.DTL/{launcher,apps,custom}
    rm -rf ~/.DTL/temp
    git clone https://github.com/Vaynnore-r/DTL.git ~/.DTL/temp


else
    echo "Canceled."
    exit 0
fi
