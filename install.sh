#!/bin/bash
read -p "Install Dark Triad Launcher? (y/n): " answer </dev/tty
if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
    echo "Proceeding..."
    cd 
    mkdir -p ~/.DTL/{launcher,apps,custom}
    rm -rf ~/.DTL/temp
    git clone https://github.com/Vaynnore-r/DTL.git ~/.DTL/temp
    clear
    read -p "Add dtl as terminal commend ? (use it only once to prevent bugs) (y/n): " answer </dev/tty
    if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
        echo "
        ## DTL commands
        alias dtl ='./~/.DTL/launcher/launcher.sh'
        " >> ~/.bashrc
        source .bashrc
    fi
else
    echo "Canceled."
    exit 0
fi
