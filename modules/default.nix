{pkgs, ...}:
with pkgs.lib.lists;
with pkgs.lib.strings; let
  enabledModules = [
    ./basic
    ./fuzzyfinder
    ./explorer
    ./treesitter
    ./bufferline
    ./colorscheme
	./statusbar
  ];
  nixConfig = map (module: (import module) pkgs) enabledModules;
  startPackages =
    unique
    (flatten (map (module: module.startPackages) nixConfig));
  optPackages =
    unique
    (flatten (map (module: module.optPackages) nixConfig));
  additionalDependencies =
    flatten
    (map (module: module.additionalDependencies) nixConfig);

  moduleNames = map (module: last (splitString "/" module)) enabledModules;
  luaConfig = (import ./setupLua.nix) {
    inherit pkgs;
    enabledModules = moduleNames;
  };
in {
  customRC = luaConfig.customRC;
  luaPath = luaConfig.luaPath;
  enabledModules = moduleNames;
  start = startPackages;
  opt = optPackages;
  inherit additionalDependencies;
}
