{pkgs, ...}:
with pkgs.lib.lists; let
  imports = [
    ./init
    ./fuzzyfinder
    ./explorer
    ./treesitter
    ./bufferline
    ./styles
  ];
  modules = map (module: (import module) pkgs) imports;
  moduleNames = map (module: module.name) modules;
  startPackages = flatten (map (module: module.startPackages) modules);
  optPackages = flatten (map (module: module.optPackages) modules);
  additionalDependencies = flatten (map (module: module.additionalDependencies) modules);
in {
  customRC = (import ./bundleRCFiles.nix) {
    inherit pkgs;
    modules = moduleNames;
  };
  start = startPackages;
  opt = optPackages;
  inherit additionalDependencies;
}
