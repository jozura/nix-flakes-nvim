{pkgs, ...}: {
  startPackages = with pkgs.vimPlugins; [
    which-key-nvim
  ];
  optPackages = [];
  additionalDependencies = [];
}

