{
  description = "NixOS configuration with Home Manager";

  inputs = {
    # TODO: Figure out how to move it out of here. Feels out-of-scope for this file.
    catppuccin.url = "github:catppuccin/nix";
    # FIXME: Go back to "github:nixos/nixpkgs/nixos-unstable" as soon as possible (turbo was very outdated, but updated 5 hours ago on master.. how lucky)
    nixpkgs.url = "github:nixos/nixpkgs/master";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      catppuccin,
      disko,
      ...
    }:
    {
      nixosConfigurations = {
        nixos-desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/nixos-desktop/configuration.nix
            catppuccin.nixosModules.catppuccin
            disko.nixosModules.default
	    (import ./hosts/nixos-desktop/disko.nix { device = "dev/nvme0n1"; })
            (home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "hm-backup";
              home-manager.users.kennethhoff.imports = [
                catppuccin.homeManagerModules.catppuccin
                ./home/users/kennethhoff/nixos-desktop.nix
              ];
            })
          ];
        };
        nixos-media = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/nixos-media/configuration.nix
            catppuccin.nixosModules.catppuccin
            (home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "hm-backup";
              home-manager.users.kennethhoff.imports = [
                catppuccin.homeManagerModules.catppuccin
                ./home/users/kennethhoff/nixos-media.nix
              ];
            })
          ];
        };
        nixos-dell = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/nixos-dell/configuration.nix
            catppuccin.nixosModules.catppuccin
            (home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "hm-backup";
              home-manager.users.kennethhoff.imports = [
                catppuccin.homeManagerModules.catppuccin
                ./home/users/kennethhoff/nixos-dell.nix
              ];
            })
          ];
        };
      };
    };
}
