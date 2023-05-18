{pkgs, ...}: {
  name = "explorer";
  startPackages = [pkgs.vimPlugins.nvim-tree-lua];
  optPackages = [];
  additionalDependencies = [];
}
