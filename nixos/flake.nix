{
  description = "NixOS configuration with Home Manager";

  inputs = {
    # TODO: Figure out how to move it out of here. Feels out-of-scope for this file.
    catppuccin.url = "github:catppuccin/nix";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    catppuccin,
    ...
  }: {
    nixosConfigurations = {
      nixos-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # TODO: Figure out how to move it out of here. Feels out-of-scope for this file.
          ./hosts/nixos-desktop/configuration.nix
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hm-backup";
            home-manager.users.kennethhoff = {
              imports = [
                # TODO: Figure out how to move it out of here. Feels out-of-scope for this file.
                catppuccin.homeManagerModules.catppuccin
                ./home/users/kennethhoff.nix
              ];
            };
          }
        ];
      };
      nixos-dell = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # TODO: Figure out how to move it out of here. Feels out-of-scope for this file.
          ./hosts/nixos-dell/configuration.nix
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hm-backup";
            home-manager.users.kennethhoff = {
              imports = [
                # TODO: Figure out how to move it out of here. Feels out-of-scope for this file.
                catppuccin.homeManagerModules.catppuccin
                ./home/users/kennethhoff.nix
              ];
            };
          }
        ];
      };
    };
  };
}
