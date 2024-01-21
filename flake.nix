{
  description = "Nixos config flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    neovim-minimal= {
      url = "github:jutskitting/nvim-minimal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mc-flake = {
      url = "github:jutskitting/midnight-commander-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs,neovim-minimal,mc-flake, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/default/configuration.nix
             ({ pkgs, ... }: {
                  environment.systemPackages = with pkgs; [
                  neovim-minimal.packages.${system}.default
                  mc-flake.packages.${system}.default
                ];
              })
          ];
        };

    };
}
