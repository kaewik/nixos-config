{ config, lib, pkgs, ... }:
{
  options = {
    fenix = lib.mkOption {
      type = lib.types.package;
    };
  };
  config = {
    nixpkgs.overlays = [
      config.fenix.overlays.default
      (self: super: {
        mypolybar = pkgs.polybar.override {
          i3Support = true;
        };
      })
    ];
  };
}
