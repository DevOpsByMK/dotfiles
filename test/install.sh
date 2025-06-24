#!/bin/bash

set -e

echo "Updating package lists..."
sudo apt update

echo "Installing mandatory tools..."
sudo apt install -y \
    build-essential \
    curl \
    wget \
    git \
    vim \
    zsh \
    tmux \
    htop \
    net-tools \
    python3-pip

echo "Setting up dotfiles..."

# Backup existing dotfiles if they exist
backup_file() {
    if [ -f "$1" ]; then
        echo "Backing up existing $1 to $1.backup"
        mv "$1" "$1.backup"
    fi
}

backup_file ~/.bashrc
backup_file ~/.vimrc
backup_file ~/.gitconfig

# Copy dotfiles from repo to home
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp gitconfig ~/.gitconfig

echo "Done! Please restart your terminal or source your ~/.bashrc"
