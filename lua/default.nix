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
      mkdir -p $out/lua/
      mv ./init.lua $out/init.lua
      cp -r ./* $out/lua/
    '';
  };
in {
  # Sets ./init.lua as the entrypoint to my neovim config
  customRC = "
    echo \"${modulesDerivation}\"
    set rtp+=${modulesDerivation}
    luafile ${modulesDerivation}/init.lua
  ";
}
