{ pkgs, ... }:
let
  unstable = import <nixos-unstable> { };
  fenixTarball = fetchTarball {
    url = "https://github.com/nix-community/fenix/archive/main.tar.gz";
    sha256 = "19gv0rrjnzw6fydx9c7v11fr9jl18fz110cr4310xyjmfpvyck7z";
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
