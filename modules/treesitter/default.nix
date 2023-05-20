{pkgs, ...}: {
  startPackages = [
    (pkgs
      .vimPlugins
      .nvim-treesitter
      .withPlugins
      (ps: with ps; [nix lua]))
  ];
  optPackages = [];
  additionalDependencies = [];
}

