{
  pkgs,
  ...
}:
with pkgs.lib.attrsets;
with pkgs.lib.lists;
with pkgs.lib.strings;
with pkgs.lib.trivial;
with builtins;
with pkgs; let
  modulesPath = ./.;
  modulesDerivation = stdenv.mkDerivation {
    name = "lua-config-nvim";
    src = modulesPath;
    installPhase = ''
      mkdir -p $out/
      cp -r ./* $out/
    '';
  };
in {
  # Sets ./init.lua as the entrypoint to my neovim config
  customRC = "luafile ${modulesDerivation}/init.lua";
}
