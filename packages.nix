{ pkgs, ... }:
let
  unstable = import <nixos-unstable> { };
in
{
  nixpkgs.overlays = with pkgs;
    [
      (self: super: {
        mypolybar = polybar.override {
          i3Support = true;
        };
      })
      (import "${fetchTarball "https://github.com/nix-community/fenix/archive/main.tar.gz"}/overlay.nix")
    ];

  environment.systemPackages = with pkgs;
    [
      # apps
      alacritty
      firefox

      # cli utils
      delta
      jq
      fd
      fzf
      git
      git-lfs
      lsof
      neovim
      ripgrep
      tree
      unzip
      zip
      zsh

      # ui
      i3lock-fancy
      mypolybar
    ];
}
