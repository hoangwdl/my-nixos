{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";  # Match your system.stateVersion
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";  # adjust if needed
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          inherit self nixpkgs home-manager;
        };
      };
    };
}

