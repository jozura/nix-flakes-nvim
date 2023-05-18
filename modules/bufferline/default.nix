{pkgs, ...}: {
  name = "bufferline";
  startPackages = with pkgs.vimPlugins; [bufferline-nvim];
  optPackages = [];
  additionalDependencies = [];
}
