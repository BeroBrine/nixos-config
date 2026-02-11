{
  description = "Abhishek's Nix Config";

  inputs =  {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11"; 
    catppuccin.url = "github:catppuccin/nix";
    nixos-apple-silicon = {
      url = "github:nix-community/nixos-apple-silicon";
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


  outputs = {nixpkgs , home-manager , stylix, nvf , catppuccin ,nixos-apple-silicon ,...}: let 
    system = "aarch64-linux";
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
          nixos-apple-silicon.nixosModules.default
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
