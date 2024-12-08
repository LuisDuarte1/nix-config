{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
    }:
    {
      nixosConfigurations = {

        lduarte-laptop = nixpkgs.lib.nixosSystem {
          modules = [
            ./nixos/hardware-configuration/lduarte-laptop.nix
            ./nixos/configuration.nix
            home-manager.nixosModules.home-manager
            {
              # NOTE(lduarte): allow for unfree packages installed by the user (and not globally)
              nixpkgs.config.allowUnfree = true;

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.luisd = {
                imports = [
                  ./home/base.nix
                  ./home/i3.nix
                ];
              };
            }
          ];
        };
      };
    };
}
