{
  description = "Nixos config flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    neovim-nix= {
      url = "github:jutskitting/nvim-minimal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs,neovim-nix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      devShells.${system} = nixpkgs.legacyPackages.${system}.mkShell {
        buildInputs = [
          self.pkgs.hello
          neovim-nix.packages.${system}.default
        ];
      };

    
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/default/configuration.nix
          ];
        };

    };
}
