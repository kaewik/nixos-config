{ pkgs, ... }:
let
  unstable = import <nixos-unstable> { };
  fenixTarball = fetchTarball {
    url = "https://github.com/nix-community/fenix/archive/main.tar.gz";
    sha256 = "151sbf5f354bd0l1634x7i9swgrpgwdcbmkrhjg052302xm1h07r";
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
