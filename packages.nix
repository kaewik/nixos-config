{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    fenix = lib.mkOption {
      type = lib.types.package;
    };
    mypolybar = lib.mkOption {
      type = lib.types.package;
    };
    neovim = lib.mkOption {
      type = lib.types.package;
    };
  };
  config = {
    environment.systemPackages = with pkgs; [
      # apps
      alacritty
      bitwarden
      firefox
      slack

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

      # rust tools
      (config.fenix.packages.x86_64-linux.complete.withComponents [
        "cargo"
        "clippy"
        "rust-src"
        "rustc"
        "rustfmt"
      ])
      rust-analyzer-nightly
    ];
  };
}
