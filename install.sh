#!/bin/bash
read -p "Install Dark Triad Luncher? (y/n): " answer

if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
    echo "Proceeding..."
    mkdir ~/.DTL/luncher
    mkdir ~/.DTL/apps
    mkdir ~/.DTL/custom
    git clone https://github.com/Vaynnore-r/DTL.git ~/.DTL/luncher
    
else
    echo "Canceled."
    exit 0
fi
