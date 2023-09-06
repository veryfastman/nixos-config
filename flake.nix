{
    description = "My NixOS flake";
    
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nur.url = "github:nix-community/nur";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        wallpaper-collection = {
            url = "github:veryfastman/wallpaper-collection";
            flake = false;
        };
    };

    outputs = inputs@{ self, nixpkgs, nur, home-manager, wallpaper-collection }:
    let
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };

        extraModules = [ nur.nixosModules.nur ];
        
        homeManagerConfiguration = {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.donny = {
                imports = [ ./home.nix ];
                _module.args.nur = { inherit nur; };
            };
            home-manager.extraSpecialArgs = { inherit inputs; };
            nixpkgs.overlays = [ nur.overlay ];
        };
    in {
        nixosConfigurations = {
            laptop = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/laptop
                    home-manager.nixosModules.home-manager homeManagerConfiguration
                ] ++ extraModules;
            };

            desktop = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/desktop
                    home-manager.nixosModules.home-manager homeManagerConfiguration
                ] ++ extraModules;
            };
        };
    };
}
