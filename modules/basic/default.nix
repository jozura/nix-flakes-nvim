{pkgs, ...}: {
  startPackages = with pkgs.vimPlugins; [];
  optPackages = [];
  additionalDependencies = [];
}

