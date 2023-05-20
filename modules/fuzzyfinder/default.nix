{pkgs, ...}: {
  startPackages = [pkgs.vimPlugins.telescope-nvim];
  optPackages = [];
  additionalDependencies = [pkgs.ripgrep];
}

