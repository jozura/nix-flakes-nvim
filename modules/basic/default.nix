{pkgs, ...}: {
  name = "basic";
  startPackages = with pkgs.vimPlugins; [];
  optPackages = [];
  additionalDependencies = [];
}

