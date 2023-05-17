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
        wrap-neovim-fun = pkgs:
          pkgs.wrapNeovim pkgs.neovim-unwrapped {
            viAlias = true;
            configure = {
              packages.myVimPackage = with pkgs.vimPlugins; {
                start = [telescope-nvim];
              };

              customRC = ((import ./modules) pkgs).customRC;
            };
          };

        my-neovim-overlay = self: super: {
          myNeovim = wrap-neovim-fun super;
        };

        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            my-neovim-overlay
          ];
        };
      in {
        packages.ripgrep = pkgs.ripgrep;
        packages.default = pkgs.myNeovim;
        apps.default = {
          type = "app";
          program = "${pkgs.myNeovim}/bin/nvim";
        };
      }
    );
}
