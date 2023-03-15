{
  # Description, write anything or even nothing
  description = "Kaewiks NixOS Flake";

  # Input config, or package repos
  inputs = {
    # Nixpkgs, NixOS's official repo
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Homemanager Flake
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Neovim Flake
    neovim-flake.url = "github:kaewik/neovim-flake";

    # fenix - rust tool chain
    fenix.url = "github:nix-community/fenix";
    fenix.inputs.nixpkgs.follows = "nixpkgs";
  };

  # Output config, or config for NixOS system
  outputs = {
    nixpkgs,
    home-manager,
    neovim-flake,
    fenix,
    ...
  } @ inputs: {
    defaultPackage.x86_64-linux = fenix.packages.x86_64-linux.minimal.toolchain;
    # Define a system called "nixos"
    nixosConfigurations."kaesemondwikinger" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        {
          fenix = fenix;
          neovim = neovim-flake.packages.x86_64-linux.default;
        }
        ./overlays.nix
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.kaewik = import ./home.nix;
        }
      ];
    };
  };
}
