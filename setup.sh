#! /usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

sudo ln -sf $SCRIPT_DIR/configuration.nix /etc/nixos/configuration.nix
sudo ln -sf $SCRIPT_DIR/flake.nix /etc/nixos/flake.nix
sudo ln -sf $SCRIPT_DIR/flake.lock /etc/nixos/flake.lock
