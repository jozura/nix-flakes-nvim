{pkgs, ...}: {
  startPackages = with pkgs.vimPlugins; [
    nvim-lspconfig
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-cmdline
    luasnip
    cmp_luasnip
    nvim-cmp
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
