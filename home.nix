{config, ...}: {
  home = {
    username = "kaewik";
    homeDirectory = "/home/kaewik";
    packages = [
    ];
    stateVersion = "22.11";
  };
  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "kaewik";
      userEmail = "32685131+kaewik@users.noreply.github.com";
    };
    zsh = {
      enable = true;
      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
      oh-my-zsh = {
        enable = true;
        plugins = ["git"];
        theme = "robbyrussell";
      };
    };
  };
}
