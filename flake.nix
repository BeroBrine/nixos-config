{
  description = "Abhishek's Nix Config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    catppuccin.url = "github:catppuccin/nix";
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agy-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      stylix,
      nvf,
      catppuccin,
      noctalia,
      agy-nix,
      ...
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
            inherit
              username
              hostname
              inputs
              agy-nix
              ;
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
          catppuccin.homeModules.catppuccin
          noctalia.homeModules.default
          stylix.homeModules.stylix
          ./modules/home

        ];
      };
    };
}
