{
  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
    home-manager.url = github:nix-community/home-manager;
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      }; 

      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        desktop = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
        };
      };
    };
}
