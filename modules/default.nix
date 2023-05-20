{pkgs, ...}:
with pkgs.lib.lists; let
  imports = [
    ./basic
    ./fuzzyfinder
    ./explorer
    ./treesitter
    ./bufferline
    ./colorscheme
  ];
  modules = map (module: (import module) pkgs) imports;
  moduleNames = map (module: module.name) modules;
  startPackages = flatten (map (module: module.startPackages) modules);
  optPackages = flatten (map (module: module.optPackages) modules);
  additionalDependencies =
    flatten
    (map (module: module.additionalDependencies) modules);
  luaConfig = (import ./setupLua.nix) {
    inherit pkgs;
    modules = moduleNames;
  };
in {
  customRC = luaConfig.customRC;
  luaPath = luaConfig.luaPath;
  start = startPackages;
  opt = optPackages;
  inherit additionalDependencies;
}
