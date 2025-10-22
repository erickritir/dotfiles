#!/bin/bash

# variables
dotfilesdir="$HOME/dotfiles"
fonts_path="$HOME/.local/share/fonts"
ghostty_path="$HOME/.config/ghostty"
ruff_path="$HOME/.config/ruff"

# fonts
echo "Installing fonts"
cp "$dotfilesdir/fonts/*" "$fonts_path/"

# zsh
files=(zshrc aliases)
for file in "${files[@]}"; do
    backup "${HOME}/.${file}"
    echo "Creating symlink to $file in home directory."
    ln -sf "${dotfilesdir}/settings/.${file}" "${HOME}/.${file}"
done

# ruff
if [ ! -d "$ruff_path" ]; then
    echo "Creating ruff folder"
    mkdir -p "$ruff_path"
fi
backup "$ruff_path/ruff.toml"
echo "Creating symlink to ruff file"
ln -sf "$dotfilesdir/settings/ruff.toml" "$ruff_path/ruff.toml"

# gnome
echo "Loading gnome settings"
dconf load / < "$dotfilesdir/settings/gnome_settings.ini"

# ghostty theme
echo "Setting up ghostty theme"
if [ ! -d "$ghostty_path/themes" ]; then
    echo "creating ghostty themes folder"
    mkdir -p "$ghostty_path/themes"
fi
ln -sf "$dotfilesdir/settings/ghostty_theme" "$ghostty_path/themes/my-theme"

# ghostty
echo "Creating symlink to ghostty config"
backup "$ghostty_path/config"
ln -sf "$dotfilesdir/settings/ghostty" "$ghostty_path/config"

# font rendering
echo "Setting font rendering"
cp "$dotfilesdir/etc/environment" "/etc/environment"
