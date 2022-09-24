{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz";
  nvim = (import ./nvim.nix) pkgs;
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users.kaewik = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "realtime" "docker" ];
  };

  home-manager.users.kaewik = {
    programs.git = {
      enable = true;
      userName  = "kaewik";
      userEmail = "32685131+kaewik@users.noreply.github.com";
    };

    home.packages = nvim.dependencies;

    xdg.configFile."nvim" = {
      source = nvim.configPath;
      recursive = true;
    };
  };
}
