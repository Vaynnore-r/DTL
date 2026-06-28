#!/bin/bash
read -p "Install Dark Triad Launcher? (y/n): " answer </dev/tty
if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
    read -p "Backup Curent DTL data (y/n): " answer </dev/tty
    if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
        mkdir ~/DTL_backup
        mv -f ~/.DTL/* ~/DTL_backup
        echo "Backup done"
    else
        rm -rf ~/.DTL/*
    fi
    echo "Proceeding..."
    mkdir -p ~/.DTL/{launcher,apps,custom,temp}
    git clone https://github.com/Vaynnore-r/DTL.git ~/.DTL/temp
    mv -f ~/.DTL/temp/launcher/* ~/.DTL/launcher
    clear
    if ! grep -q "alias dtl='$HOME/.DTL/launcher/launcher.sh'" ~/.bashrc; then
        echo "alias dtl='$HOME/.DTL/launcher/launcher.sh'" >> ~/.bashrc
        source .bashrc
    fi
else
    echo "Canceled."
    exit 0
fi
