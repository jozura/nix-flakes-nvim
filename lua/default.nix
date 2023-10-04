{
  pkgs,
  ...
}:
let
  modulesPath = ./.;
  modulesDerivation = pkgs.stdenv.mkDerivation {
    name = "lua-config-nvim";
    src = modulesPath;
    installPhase = ''
      mkdir -p $out/lua/
      mv ./init.lua $out/init.lua
      cp -r ./cfgs/* $out/lua/
    '';
  };
in {
  # Sets ./init.lua as the entrypoint to my neovim config
  customRC = "
    set rtp+=${modulesDerivation}
    luafile ${modulesDerivation}/init.lua
  ";
}
