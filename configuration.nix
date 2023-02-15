{ config, pkgs, lib, ... }:
{
  imports = [
    ./env.nix
    ./hardware-configuration.nix
    ./packages.nix
    ./polybar.nix
    ./windowmanager.nix
  ];

  config = {
    nixpkgs.config.allowUnfree = true;

    nix = {
      package = pkgs.nixUnstable;
      extraOptions = ''
          experimental-features = nix-command flakes
      '';
      settings.auto-optimise-store = true;
    };

    time.timeZone = "Europe/Berlin";

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users = {
      defaultUserShell = pkgs.zsh;
      users.kaewik = {
        isNormalUser = true;
        extraGroups = [ "wheel" "audio" "realtime" "docker" ];
      };
    };

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

    # Use the GRUB 2 boot loader.
    boot.loader.grub = {
      enable = true;
      version = 2;
      # boot.loader.grub.efiSupport = true;
      # boot.loader.grub.efiInstallAsRemovable = true;
      # boot.loader.efi.efiSysMountPoint = "/boot/efi";
      # Define on which hard drive you want to install Grub.
      device = "/dev/sda"; # or "nodev" for efi only
    };

    system.stateVersion = "22.05";
  };
}
