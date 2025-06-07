{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming.url = "github:fufexan/nix-gaming";
    agenix.url = "github:ryantm/agenix";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nix-flatpak, ... }:

  let
    system = "x86_64-linux";

  in {
    nixosConfigurations = {
      skynet = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./hosts/skynet/configuration.nix
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs.flake-inputs = inputs;

            home-manager.users.jordan = {
              imports = [
                ./home/jordan/home.nix
              ];
            };
          }
        ];
      };
    };

    packages.${system}.jordan = let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    
    hmConfig = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs; };
      modules = [ ./home/jordan/home.nix ];
    };
    in
      hmConfig.activationPackage;
  };
}
