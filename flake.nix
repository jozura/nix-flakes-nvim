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
        customRC = ((import ./modules) pkgs).customRC;
        additionalDependencies = [pkgs.ripgrep];
        wrapNeovim = pkgs:
          pkgs.wrapNeovim pkgs.neovim-unwrapped {
            configure = {
              packages.myVimPackage = with pkgs.vimPlugins; {
                start = [telescope-nvim];
              };

              inherit customRC;
            };
          };

        my-neovim-overlay = self: super: {
          myNeovim = wrapNeovim super;
        };

        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            my-neovim-overlay
          ];
        };
      in rec {
        packages.default = pkgs.writeShellApplication {
          name = "nix-flakes-nvim";
          runtimeInputs = [pkgs.myNeovim] ++ additionalDependencies;
          text = ''
            nvim
          '';
        };
        apps.default = {
          type = "app";
          program = "${packages.default}/bin/nix-flakes-nvim";
        };
      }
    );
}
