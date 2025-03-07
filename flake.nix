{
  description = "Abhishek Rana's Nix Config";

  inputs =  {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11"; 
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs , home-manager ,...}: let 
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
        modules = [./hosts/${hostname}];
      };
    };

		homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			extraSpecialArgs = {
				inherit username;
				inherit hostname;
			};
			modules = [./modules/home];
		};	

  };

}
