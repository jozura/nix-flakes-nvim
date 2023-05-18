{pkgs, ...}: {
  name = "styles";
  startPackages = with pkgs.vimPlugins; [kanagawa-nvim indent-blankline-nvim];
  optPackages = [];
  additionalDependencies = [];
}
