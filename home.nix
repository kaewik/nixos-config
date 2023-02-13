{ neovimConfig, ... }:
{
  home = {
    username = "kaewik";
    homeDirectory = "/home/kaewik";
    packages = [
      neovimConfig
    ];
    stateVersion = "22.11";
  };
  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName  = "kaewik";
      userEmail = "32685131+kaewik@users.noreply.github.com";
    };
  };

  xdg.configFile."nvim".source = neovimConfig;
}
