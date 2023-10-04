{pkgs, ...}:
with pkgs.lib.lists;
with pkgs.lib.strings; let
  enabledModules = [
    ./basic
    ./explorer
    ./bufferline
    ./colorscheme
    ./statusbar
    ./lang
    ./whichkey
  ];
  moduleNames = map (module: last (splitString "/" module)) enabledModules;
  luaConfig = (import ./setupLua.nix) {
    inherit pkgs;
    enabledModules = moduleNames;
  };
in {
  customRC = luaConfig.customRC;
  luaPath = luaConfig.luaPath;
  enabledModules = moduleNames;
}
