{pkgs, ...}: {
  startPackages = with pkgs.vimPlugins; [
    lualine-nvim
    lualine-lsp-progress
  ];
  optPackages = [];
  additionalDependencies = [];
}

