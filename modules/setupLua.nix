{
  pkgs,
  enabledModules,
  ...
}:
with pkgs.lib.attrsets;
with pkgs.lib.lists;
with pkgs.lib.strings;
with pkgs.lib.trivial;
with builtins;
with pkgs; let
  modulesPath = ./.;

  # Copy the modules folder into nix store
  modulesDerivation = stdenv.mkDerivation {
    name = "lua-config-nvim";
    src = modulesPath;
    installPhase = ''
      mkdir -p $out/
      cp -r ./* $out/
    '';
  };

  modulesLuaPaths =
    map
    (mod: "${modulesDerivation}/${mod}/?.lua")
    enabledModules;
  luaPath = concatStringsSep ";" modulesLuaPaths;
in {
  # Sets ./init.lua as the entrypoint to my neovim config
  customRC = "luafile ${modulesDerivation}/init.lua";
  # Sets the $LUA_PATH environment variable such that files
  # matching modules/*/*.lua can be found by neovim
  luaPath = "${luaPath}";
}
