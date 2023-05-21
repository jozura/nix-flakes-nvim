{pkgs, ...}: {
  startPackages = with pkgs.vimPlugins; [
    nvim-lspconfig
    # Autocompletion
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-cmdline
    nvim-cmp
    # Snippets (used by Autocompletion)
    luasnip
    cmp_luasnip
  ];
  optPackages = [];
  additionalDependencies = [
  	pkgs.clojure-lsp
	pkgs.nil
	pkgs.sumneko-lua-language-server
	pkgs.nodePackages.typescript
	pkgs.nodePackages.typescript-language-server
  ];
}
