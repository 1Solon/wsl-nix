<div align="center">

<img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake.svg" align="center" width="144px" height="144px"/>

## Solon's WSL-Nix Configuration

_A reproducible developer environment using NixOS on WSL with Home Manager and Nix Flakes_

</div>

<div align="center">

![GitHub Repo stars](https://img.shields.io/github/stars/1Solon/wsl-nix?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/1Solon/wsl-nix?style=for-the-badge)

</div>

# 🐧💻 WSL-Nix Configuration

This repository contains configuration files for setting up NixOS on Windows Subsystem for Linux (WSL). It provides a reproducible environment using the Nix package manager and Home Manager.

## 🔎 Overview

This project uses:

- 🐧 [NixOS-WSL](https://github.com/nix-community/NixOS-WSL) for running NixOS under Windows Subsystem for Linux
- 🏠 [Home Manager](https://github.com/nix-community/home-manager) for user environment configuration
- ❄️ [Nix Flakes](https://nixos.wiki/wiki/Flakes) for reproducible builds and dependency management

## 📁 Files

- `configuration.nix` - System-wide NixOS configuration
- `home.nix` - User-specific Home Manager configuration
- `flake.nix` - Nix Flakes configuration for reproducible builds
- `init.sh` - Initial setup script for NixOS on WSL

## 🚀 Getting Started

### ✅ Prerequisites

- Windows 10 build 19041 or later / Windows 11
- WSL2 installed and configured
- A WSL NixOS distribution (see [NixOS-WSL](https://github.com/nix-community/NixOS-WSL) for installation instructions)

### 🏗️ Initial Setup

1. Clone this repository:

   ```powershell
   git clone https://github.com/1Solon/wsl-nix.git
   cd wsl-nix
   ```

2. Run the initialization script:

   ```bash
   ./init.sh
   ```

### 🔄 Updating

To update your configuration after making changes:

```bash
# System configuration
update

# User configuration
switch
```

## ⚙️ Customization

- Edit `configuration.nix` to modify system-wide settings
- Edit `home.nix` to modify user environment settings
- Edit `flake.nix` to update dependencies or add new inputs
