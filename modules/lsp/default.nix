{pkgs, ...}: {
  startPackages = with pkgs.vimPlugins; [nvim-lspconfig];
  optPackages = [];
  additionalDependencies = [
  	pkgs.clojure-lsp
	pkgs.nil
	pkgs.sumneko-lua-language-server
	pkgs.nodePackages.typescript
	pkgs.nodePackages.typescript-language-server
  ];
}
