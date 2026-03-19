{
  description = "Abhishek's Nix Config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    catppuccin.url = "github:catppuccin/nix";
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs
    , home-manager
    , stylix
    , nvf
    , catppuccin
    , caelestia-shell
    , ...
    }@inputs:
    let
      system = "aarch64-linux";
      hostname = "nixos";
      username = "abhishek";
      pkgs = nixpkgs.legacyPackages.${system};

    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit username hostname inputs;
          };
          modules = [
            stylix.nixosModules.stylix
            ./hosts/${hostname}
          ];
        };
      };

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit username hostname inputs;
        };
        modules = [
          # nvf.homeManagerModules.default
          { nixpkgs.config.allowUnsupportedSystem = true; }
          catppuccin.homeModules.catppuccin
          caelestia-shell.homeManagerModules.default
          stylix.homeModules.stylix
          ./modules/home

        ];
      };
    };
}
