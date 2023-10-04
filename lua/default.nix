{
  pkgs,
  ...
}:
let
  modulesDerivation = pkgs.stdenv.mkDerivation {
    name = "lua-config-nvim";
    src = ./.;
    installPhase = ''
      mkdir -p $out/lua/
      mv ./init.lua $out/init.lua
      cp -r ./cfgs/* $out/lua/
    '';
  };
in {
  customRC = "
    set rtp+=${modulesDerivation}
    luafile ${modulesDerivation}/init.lua
  ";
}
