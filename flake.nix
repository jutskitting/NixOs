{
  description = "Nixos config flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    neovim-minimal-flake = {
      url = "github:jutskitting/nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs,neovim-minimal-flake, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system} = nixpkgs.legacyPackages.${system}.mkShell {
        buildInputs = [
          neovim-minimal-flake.packages.${system}.default
          self.pkgs.hello
        ];
      };

    
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
                ./hosts/default/configuration.nix
                #neovim-minimal-flake.packages.x86_64-linux.customNeovim
          ];
        };

    };
}
