{pkgs, ...}: {
  startPackages = with pkgs.vimPlugins; [indent-blankline-nvim vim-sleuth];
  optPackages = [];
  additionalDependencies = [];
}

