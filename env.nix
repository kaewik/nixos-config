{ lib, ... }:
{
  environment.variables = {
    EDITOR = "nvim";
    TERM = "alacritty";
  };
}
