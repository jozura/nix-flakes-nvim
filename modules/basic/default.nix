{pkgs, ...}: {
  startPackages = with pkgs.vimPlugins; [indent-blankline-nvim];
  optPackages = [];
  additionalDependencies = [];
}

