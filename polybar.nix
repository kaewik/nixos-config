{ pkgs, config, ... }:
{
  environment.etc."polybar".source = ./polybar;
}
