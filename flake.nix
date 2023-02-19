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

    # neovim-config
   # neovim-config.url = "github:kaewik/neovim-config/master";
   # neovim-config.flake = false;

    neovim-config.url = "github:jordanisaacs/neovim-flake";
    # fenix - rust tool chain
    fenix.url = "github:nix-community/fenix";
    fenix.inputs.nixpkgs.follows = "nixpkgs";
  };

  # Output config, or config for NixOS system
  outputs = { nixpkgs, home-manager, neovim-config, fenix, ... }@inputs: {
    defaultPackage.x86_64-linux = fenix.packages.x86_64-linux.minimal.toolchain;
    # Define a system called "nixos"
    nixosConfigurations."kaesemondwikinger" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        {
          fenix = fenix;
        }
        ./overlays.nix
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.kaewik = import ./home.nix {
	    neovimConfig=neovim-config;
	  };
        }
      ];
    };

    # You can define many systems in one Flake file.
    # NixOS will choose one based on your hostname.
    #
    # nixosConfigurations."nixos2" = nixpkgs.lib.nixosSystem {
    #   system = "x86_64-linux";
    #   modules = [
    #     ./configuration2.nix
    #   ];
    # };
  };
}
