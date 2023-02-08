{ pkgs, ... }:
let
  unstable = import <nixos-unstable> { };
  fenixTarball = fetchTarball {
    url = "https://github.com/nix-community/fenix/archive/main.tar.gz";
    sha256 = "c3910de723c6740cfc455d154ff73d0135f51b60d36b99d93c6ddf5bfeed2822";
  };
in
{
  nixpkgs.overlays = with pkgs;
    [
      (self: super: {
        mypolybar = polybar.override {
          i3Support = true;
        };
      })
      (import "${fenixTarball}/overlay.nix")
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
      gcc
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
