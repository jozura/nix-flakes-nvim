{
  description = "My neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    vim-illuminate = {
      url = "github:RRethy/vim-illuminate/master";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    flake-utils,
    vim-illuminate,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        startPkgs = map 
          ({src, name}: pkgs.vimUtils.buildVimPlugin { inherit src; inherit name; })
          [
            {name = "vim-illuminate"; src = vim-illuminate;}
          ];
        optPkgs = map 
          ({src, name}: pkgs.vimUtils.buildVimPlugin { inherit src; inherit name; })
          [
          ];

        pkgs = nixpkgs.legacyPackages.${system};
        moduleConfig = (import ./modules) pkgs;
        myNeovim = pkgs.wrapNeovim pkgs.neovim-unwrapped {
          configure = {
            packages.myVimPackage = {
              start = moduleConfig.start ++ [startPkgs] ++ [optPkgs];
              opt = moduleConfig.opt;
            };
            customRC = moduleConfig.customRC;
          };
        };
        enabledModules = builtins.concatStringsSep " " moduleConfig.enabledModules;
      in {
        packages.default = pkgs.writeShellApplication {
          name = "myvim";
          runtimeInputs = [myNeovim] ++ moduleConfig.additionalDependencies;
          text = ''
            export ENABLED_MODULES="${enabledModules}"
            export LUA_PATH="${moduleConfig.luaPath};"
            nvim "$@"
          '';
        };
      }
    );
}
