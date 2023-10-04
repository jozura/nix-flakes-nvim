{
  description = "My neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
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
