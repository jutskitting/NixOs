{
  description = "Nixos config flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    neovim-minimal-flake.url = "path:/home/kit/Documents/flakes/neovim-minimal";

  };

  outputs = { self, nixpkgs,neovim-minimal-flake, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
                ./hosts/default/configuration.nix
                #neovim-minimal-flake.packages.x86_64-linux.customNeovim
          ];
        };

    };
}
