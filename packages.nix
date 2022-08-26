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

  programs.adb.enable = true;

  environment.systemPackages = with pkgs;
    [
      # apps
      alacritty
      discord

      # cli utils
      bat
      binutils
      delta
      jq
      fd
      fzf
      git
      git-lfs
      lsof
      ripgrep
      tree
      unzip
      zip
      zsh

      # ui
      brightnessctl
      i3lock-fancy
      mypolybar

      # stuff
      clang
      lld
      lldb
      killall
      pkg-config
      wget
      wpa_supplicant
      usbutils
      graphviz

      # audio
      pamixer

      # rust
      rustup
      rust-analyzer

      # haskell
      stack
      ghc
      haskell-language-server

      # javascript 
      nodejs
    ];
}
