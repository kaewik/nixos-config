{
  pkgs,
  config,
  ...
}: {
  # High DPI settings
  # hardware.video.hidpi.enable = true;

  environment.pathsToLink = ["/libexec"];

  services.xserver = {
    # general settings
    enable = true;

    #videoDrivers = [ "amdgpu" ];

    # input
    libinput.enable = true;

    displayManager = {
      lightdm.enable = true;
      defaultSession = "none+i3";
    };

    desktopManager = {
      xterm.enable = false;
    };

    windowManager = {
      i3 = {
        enable = true;
        configFile = "/etc/i3.conf";
        extraPackages = with pkgs; [
          rofi
          polybar
        ];
      };
    };
  };

  environment.etc."i3.conf".source = ./i3conf.config;
}
