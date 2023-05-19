{pkgs, ...}: {
  name = "styles";
  startPackages = with pkgs.vimPlugins; [
  	kanagawa-nvim
	indent-blankline-nvim
	lualine-nvim
	lualine-lsp-progress
  ];
  optPackages = [];
  additionalDependencies = [];
}
