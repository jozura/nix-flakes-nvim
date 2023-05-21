{pkgs, ...}: {
  startPackages = with pkgs.vimPlugins; [nvim-lspconfig lspsaga-nvim];
  optPackages = [];
  additionalDependencies = [
  	pkgs.clojure-lsp
	pkgs.java-language-server
	pkgs.nil
	pkgs.sumneko-lua-language-server
  ];
}
