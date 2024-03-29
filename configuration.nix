{
  config,
  pkgs,
  lib,
  ...
}: {
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
        extraGroups = ["wheel" "audio" "realtime" "docker" "video" "audio"];
      };
    };

    programs.light.enable = true;
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.support32Bit = true; ## If compatibility with 32-bit applications is desired.
    nixpkgs.config.pulseaudio = true; # allow alsa to forward to pulseaudio

    networking = {
      wireless.enable = true;
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
      (pkgs.nerdfonts.override {fonts = ["Meslo" "Iosevka"];})
    ];

    # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.initrd.luks.devices.root = {
      device = "/dev/disk/by-uuid/7ecc7506-80b5-4ed4-82dc-64b38bb8d8c8";
      preLVM = true;
      allowDiscards = true;
    };
    boot.supportedFilesystems = ["ntfs"];
    system.stateVersion = "22.05";
  };
}
