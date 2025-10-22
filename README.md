# About
This repository automatically sets up a development environment for Fedora.

All the configuration files are based on my personal preferences.

## Getting Started

### Prerequisites
- Fedora as your OS.

## Project Structure
- `/settings`: Contains the dotfiles for the apps
- `/fonts`: Alternative fonts to be installed in the system
- `/etc`: Contains configuration files for the system
- `install.sh`: Entrypoint to running the scripts
- `fedora.sh`: Updates the system and sets some preferences
- `apps.sh`: Contains applications to be installed
- `customization.sh`: Sets the preferences for the apps and system with the dotfiles stored in the `/settings`, `/themes` and `/etc` folders.
- `vscode.sh`: Installs extensions and sets the preferences with the dotfiles stored in the `/settings` folder


## Before Installation
- **WARNING:** Running these scripts will **modify** your system and **install** some applications, so before you running them it's highly recomended to read them very carefully. 
- All the configuration files are based on my personal preferences, but you can use yor own dotfiles (next chapter).

### Customizing Your Setup

If you want to use your own dotfiles, you can change them in the `/settings` folder.


## Installing
1. Clone this repository to your home folder:
``` sh
git clone {} ~/dotfiles
```
2. Navigate to the `dotfiles` directory:
``` sh
cd ~/dotfiles
```
3. Make the `install` script executable:
``` sh
chmod +x ./install.sh
```
4. Run the `install` script with privileges: 
``` sh
sudo ./install.sh
```

Running the `install` script will:
- Update and modify the system 
- Install applications
- Backup the configuration files to `~/dotfiles/backups/` with the current timestamp
- Create symlinks pointing the dotfiles stored in the `/settings` folder to the configuration files of the applications

