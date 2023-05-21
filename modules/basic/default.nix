{pkgs, ...}: {
  startPackages = with pkgs.vimPlugins; [
    indent-blankline-nvim
    vim-sleuth
    auto-pairs
    gitsigns-nvim
  ];
  optPackages = [];
  additionalDependencies = [];
}

