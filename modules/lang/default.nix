{pkgs, ...}: {
  startPackages = with pkgs.vimPlugins; [
    (nvim-treesitter
      .withPlugins
      (ps: with ps; [nix lua clojure javascript typescript css scss html json sql yaml python regex]))
    nvim-lspconfig
    # Autocompletion
    nvim-cmp
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-cmdline
    # Epic clojure plugin
    conjure
  ];
  optPackages = [];
  additionalDependencies = [
	pkgs.babashka
  	pkgs.clojure-lsp
	pkgs.nil
	pkgs.sumneko-lua-language-server
	pkgs.nodePackages.typescript
	pkgs.nodePackages.typescript-language-server
  ];
}
