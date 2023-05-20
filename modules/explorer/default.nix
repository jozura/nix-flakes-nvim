{pkgs, ...}: {
  startPackages = with pkgs.vimPlugins; [nvim-tree-lua nvim-web-devicons];
  optPackages = [];
  additionalDependencies = [];
}

