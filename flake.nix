{
  description = "Abhishek's Nix Config";

  inputs =  {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05"; 
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs , home-manager , stylix, ...}: let 
    system = "x86_64-linux";
    hostname = "nixos";
    username = "abhishek";
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
			  ./modules/home
			];
		};	

  };

}
