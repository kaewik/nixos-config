{ config, pkgs, ... }:

{
  imports =
    [
      ./env.nix
      ./windowmanager.nix
      ./polybar.nix
      ./packages.nix
    ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Berlin";

  networking = {
    hostName = "kaesemondwikinger"; # Define your hostname.
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
  };

  fonts.fonts = with pkgs; [
    terminus_font
    corefonts
    (pkgs.nerdfonts.override { fonts = [ "Meslo" "Iosevka" ]; })
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users.kwik = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "realtime" "docker" ];
  };

  system.stateVersion = "22.05";

}
