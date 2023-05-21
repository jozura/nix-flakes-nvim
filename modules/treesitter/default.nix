{pkgs, ...}: {
  startPackages = [
    (pkgs
      .vimPlugins
      .nvim-treesitter
      .withPlugins
      (ps: with ps; [nix lua clojure javascript typescript]))
  ];
  optPackages = [];
  additionalDependencies = [];
}

