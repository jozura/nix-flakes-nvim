{pkgs, ...}: {
  startPackages = with pkgs.vimPlugins; [
    # Show indention lines
    indent-blankline-nvim
    # Automatically adjust indents
    # vim-sleuth
    # Autocomplete parens etc.
    auto-pairs
    # Show git changes next to the number col
    gitsigns-nvim
    # Find files, git actions, etc.
    telescope-nvim
    # S-expression editing
    vim-sexp
    # Rainbow parens
    rainbow
  ];
  optPackages = [];
  additionalDependencies = [pkgs.ripgrep];
}

