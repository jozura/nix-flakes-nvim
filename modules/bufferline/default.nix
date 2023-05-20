{pkgs, ...}: {
  startPackages = with pkgs.vimPlugins; [bufferline-nvim];
  optPackages = [];
  additionalDependencies = [];
}

