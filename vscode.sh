#!/bin/bash

extensions=(
    charliermarsh.ruff
    docker.docker
    eamodio.gitlens
    formulahendry.code-runner
    foxundermoon.shell-format
    mechatroner.rainbow-csv
    ms-azuretools.vscode-containers
    ms-python.debugpy
    ms-python.mypy-type-checker
    ms-python.python
    ms-python.vscode-pylance
    ms-python.vscode-python-envs
    ms-vscode.live-server
    ms-vscode.theme-predawnkit
    tamasfe.even-better-toml
    teabyii.ayu
)

installed_extensions=$(code --list-extensions)

for extension in "${extensions[@]}"; do
    if echo "$installed_extensions" | grep -qi "^$extension$"; then
        echo "$extension is already installed. Skipping..."
    else
        echo "Installing $extension..."
        code --install-extension "$extension"
    fi
done

echo "VS Code extensions have been installed."

VSCODE_USER_SETTINGS_DIR="${HOME}/.config/Code/User"

if [ -d "$VSCODE_USER_SETTINGS_DIR" ]; then
    ln -sf "${HOME}/dotfiles/settings/vscode_settings.json" "${VSCODE_USER_SETTINGS_DIR}/settings.json"
    ln -sf "${HOME}/dotfiles/settings/vscode_keybindings.json" "${VSCODE_USER_SETTINGS_DIR}/keybindings.json"

    echo "VS Code settings and keybindings have been updated."
else
    echo "VS Code user settings directory does not exist. Please ensure VS Code is installed."
fi
