{
  description = "My neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    clojure-lsp.url = "github:clojure-lsp/clojure-lsp";
    nil.url = "github:oxalica/nil";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    clojure-lsp,
    nil,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        startPlugins = with pkgs.vimPlugins; [
          # For setting keybindings
          which-key-nvim
          # Status bar
          lualine-nvim
          lualine-lsp-progress
          # Illuminate word under cursor
          vim-illuminate
          # Display git changes on the left side of the window, also git blame etc.
          gitsigns-nvim 
          # Navigation (find files, find references, etc..)
          telescope-nvim
          # Navigation (save files to a quick jump list)
          harpoon
          # Display listing of open buffers
          bufferline-nvim
          # Colorscheme
          kanagawa-nvim
          # File explorer and icons for it
          nvim-tree-lua 
          nvim-web-devicons
          # Syntax highlighting
          (nvim-treesitter
            .withPlugins
            (ps: with ps; [nix lua clojure javascript typescript css scss html json sql yaml python regex]))
          # Configure LSPs
          nvim-lspconfig
          # Autocompletion...
          nvim-cmp
          # From lsp
          cmp-nvim-lsp
          # From the current buffer
          cmp-buffer
          # For file paths
          cmp-path
          # For vim command line
          cmp-cmdline
          # Snippets
          luasnip
          # S-expression editing
          vim-sexp
          # Nice repl support for lisps
          conjure
        ];
        additionalDeps = with pkgs; [
          # Required by telescope plugin for fuzzy finding
          ripgrep
          # Language servers (that have no flakes)
          lua-language-server
        	nodePackages.typescript-language-server
        ];
        luaConfig = (import ./lua) pkgs;
        myNeovim = pkgs.wrapNeovim pkgs.neovim-unwrapped {
          configure = {
            packages.myVimPackage = {
              start = startPlugins;
              opt = [];
            };
            customRC = luaConfig.customRC;
          };
        };
      in {
        packages.default = pkgs.writeShellApplication {
          name = "myvim";
          runtimeInputs = [myNeovim clojure-lsp nil] ++ additionalDeps;
          text = ''
            nvim "$@"
          '';
        };
      }
    );
}
