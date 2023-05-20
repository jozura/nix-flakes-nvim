{
  pkgs,
  modules,
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

  filterFiles = type: directoryContents:
    attrNames (filterAttrs (k: v: v == type) directoryContents);

  module = map (mod: "${modulesDerivation}/${mod}/?.lua") (filterFiles "directory" (readDir ./.));
  luaPath = concatStringsSep ";" module;
in {
  # Sets ./init.lua as the entrypoint to my neovim config
  customRC = "luafile ${modulesDerivation}/init.lua";
  luaPath = "${luaPath}";
}
