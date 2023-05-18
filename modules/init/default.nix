{pkgs, ...}: {
  name = "init";
  startPackages = with pkgs.vimPlugins; [];
  optPackages = [];
  additionalDependencies = [];
}
