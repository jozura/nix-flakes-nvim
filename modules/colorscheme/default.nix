{pkgs, ...}: {
  startPackages = with pkgs.vimPlugins; [
    kanagawa-nvim
  ];
  optPackages = [];
  additionalDependencies = [];
}

