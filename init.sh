#!/usr/bin/env bash

# Stop on errors
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR"

echo "===== Performing initial NixOS setup ====="

# Copy configuration.nix to /etc/nixos/
echo "Copying NixOS configuration file..."
sudo mkdir -p /etc/nixos
sudo cp "$SCRIPT_DIR/configuration.nix" /etc/nixos/

# Run channel update
sudo nix-channel --update

# Run rebuild with the new configuration
sudo nixos-rebuild switch

echo "===== Applying NixOS flake configuration ====="

# Build first to catch any errors before switching
echo "Building the flake configuration..."
nix build --no-link .#homeConfigurations.nixos.activationPackage

# Check if current user is nixos
if [ "$(whoami)" = "nixos" ]; then
  # Apply the configuration by directly using the activation script from the flake
  echo "Applying the configuration as nixos user..."
  "$(nix path-info .#homeConfigurations.nixos.activationPackage)"/activate
else
  # Apply the configuration as nixos user
  echo "Current user is not nixos, switching to nixos user for activation..."
  su nixos -c "NIX_CONFIG=\"$NIX_CONFIG\" \"$(nix path-info .#homeConfigurations.nixos.activationPackage)\"/activate"
fi

# Log into 1password-cli
eval $(op signin)

# Grab kubectl and talosctl config
echo "===== Setting up kubectl and talosctl configuration ====="
mkdir -p ~/.kube
mkdir -p ~/.talos
op document get "kubeconfig" > ~/.kube/config
op document get "talosconfig" > ~/.talos/config

echo "===== Configuration applied successfully ====="
echo "You may need to restart your shell or log out and back in for all changes to take effect"
