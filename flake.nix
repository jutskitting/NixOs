{
  description = "Nixos config flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    neovim-minimal= {
      url = "github:jutskitting/nvim-minimal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs,neovim-minimal, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      devShells.${system}.default = nixpkgs.legacyPackages.${system}.mkShell {
        buildInputs = [
          pkgs.hello
          neovim-minimal.packages.${system}.default
        ];
         shellHook = ''
            echo "PATH: $PATH"
            which nvim || echo "nvim not found in PATH"
          '';
      };

      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/default/configuration.nix
          ];
        };

    };
}
