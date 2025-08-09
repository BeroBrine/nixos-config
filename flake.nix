{
  description = "Abhishek's Nix Config";

  inputs =  {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05"; 
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";

    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = {nixpkgs , home-manager , stylix, nvf , catppuccin , ...}: let 
    system = "aarch64-darwin";
    hostname = "MacAir";
    username = "abhishekrana";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit username;
          inherit hostname;
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
				inherit username;
				inherit hostname;
			};
			modules = [
        stylix.homeModules.stylix
        nvf.homeManagerModules.default
        catppuccin.homeModules.catppuccin
			  ./modules/home
			];

		};	

  };

}
