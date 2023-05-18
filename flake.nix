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
        customRC = ((import ./modules) pkgs).customRC;
        additionalDependencies = [pkgs.ripgrep];
        myNeovim = pkgs.wrapNeovim pkgs.neovim-unwrapped {
          configure = {
            packages.myVimPackage = with pkgs.vimPlugins; {
              start = [telescope-nvim];
            };

            inherit customRC;
          };
        };
      in rec {
        packages.default = pkgs.writeShellApplication {
          name = "vim";
          runtimeInputs = [myNeovim] ++ additionalDependencies;
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
