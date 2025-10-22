#!/bin/bash

# Install essential applications
echo "Installing essential applications..."
dnf install -y htop fastfetch unzip git wget curl gnome-tweaks
echo "Essential applications installed successfully."

# ghostty
dnf install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
dnf install -y ghostty

# Obsidian
echo "Installing Obsidian..."
flatpak install -y flathub md.obsidian.Obsidian
flatpak override --user --socket=wayland md.obsidian.Obsidian 
echo "Obsidian installed successfully."

# vscode
echo "Installing Visual Studio Code..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
dnf install -y code
echo "Visual Studio Code installed successfully."

# docker
echo "Installing Docker..."
dnf remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine --noautoremove
dnf -y install dnf-plugins-core
if command -v dnf4 &>/dev/null; then
  dnf4 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
else
  dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
fi
dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl enable --now docker
systemctl enable --now containerd
groupadd docker
usermod -aG docker $USER
rm -rf $ACTUAL_HOME/.docker
echo "Docker installed successfully. Please log out and back in for the group changes to take effect."
echo "Docker installed successfully."

# zsh
echo "Installing Zsh and Oh My Zsh..."
dnf install -y zsh
sudo -u $USER sh -c "RUNZSH=no $(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh) $USER
sudo -u $USER bash << EOF
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$ACTUAL_HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$ACTUAL_HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
EOF
echo "Zsh and Oh My Zsh installed successfully."

# spaceship prompt
echo "Installing spaceship prompt"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "${ZSH_CUSTOM:-$ACTUAL_HOME/.oh-my-zsh/custom}/themes/spaceship-prompt" --depth=1
ln -s "${ZSH_CUSTOM:-$ACTUAL_HOME/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme" "${ZSH_CUSTOM:-$ACTUAL_HOME/.oh-my-zsh/custom}/themes/spaceship.zsh-theme"


# eza
echo "installing eza"
dnf -y install eza

# UV
echo "installing uv"
curl -LsSf https://astral.sh/uv/install.sh | sh

# ruff
echo "installing ruff"
uv tool install ruff@latest