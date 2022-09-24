{ config, pkgs, ... }:

{
  imports =
    [
      ./env.nix
      ./home.nix
      ./packages.nix
      ./polybar.nix
      ./windowmanager.nix
    ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.auto-optimise-store = true;

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

  system.stateVersion = "22.05";

}
