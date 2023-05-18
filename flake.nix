{
  description = "My neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        moduleConfig = (import ./modules) pkgs;
        myNeovim = pkgs.wrapNeovim pkgs.neovim-unwrapped {
          configure = {
            packages.myVimPackage = {
              start = moduleConfig.start;
              opt = moduleConfig.opt;
            };
            customRC = moduleConfig.customRC;
          };
        };
      in rec {
        packages.default = pkgs.writeShellApplication {
          name = "vim";
          runtimeInputs = [myNeovim] ++ moduleConfig.additionalDependencies;
          text = ''
            nvim
          '';
        };
        apps.default = {
          type = "app";
          program = "${packages.default}/bin/vim";
        };
      }
    );
}
