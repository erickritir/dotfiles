#!/bin/bash

currentdate=$(date +%Y-%m-%d)
backupdir="${HOME}/dotfiles/backups/${currentdate}"

# Check if the script is run with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo"
    exit 1
fi

backup(){
    local file="$1"
    if [ -f "$file" ]; then
        if [ ! -d "$backupdir" ]; then
            mkdir -p "$backupdir"
        fi
        echo "Backing up $file to ${backupdir}"
        cp "$file" "${backupdir}/"
    fi   
}

run_script() {
    local scripts="$@"
    
    for script in "${scripts[@]}"; do
        if [ -f "$script" ]; then
            echo "Running $script"
            source "./${script}.sh"
        else
            echo "Script $script doesn't exist"
        fi
    done
}

file_scripts=(fedora git apps vscode customization)

for script in "file_scripts"
    run_script $script

echo "Done"
