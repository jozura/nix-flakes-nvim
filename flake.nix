{
  description = "My neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
    nil-flake.url = "github:oxalica/nil";
    zls-flake.url = "github:zigtools/zls/0.15.1";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    nil-flake,
    zls-flake,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        nil = nil-flake.packages.${system}.nil;
        zls = zls-flake.packages.${system}.zls;
        clojure-test-tree-nvim = pkgs.vimUtils.buildVimPlugin {
          name = "clojure-test-tree-nvim";
          src = pkgs.fetchFromGitHub {
            owner = "jozura";
            repo = "clojure-test-tree.nvim";
            rev = "main";
            sha256 = "sha256-Sw2sO0o55b8BZsDIrZPj9pztrJnh7bHf52k8RSMWyz8=";
          };
        };
        kvlt = pkgs.vimUtils.buildVimPlugin {
          name = "kvlt";
          src = pkgs.fetchFromGitHub {
            owner = "metalelf0";
            repo = "black-metal-theme-neovim";
            rev = "main";
            sha256 = "sha256-0RY/kek2QoL3ZIWehJFQIFOOpAgCrh/POpKklzQ2UKw=";
          };
        };
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
          # Another git plugin
          vim-fugitive
          # Navigation (find files, find references, etc..)
          telescope-nvim
          # Colorscheme
          kvlt
          catppuccin-nvim
          # File explorer and icons for it
          nvim-tree-lua 
          nvim-web-devicons
          # Syntax highlighting
          nvim-treesitter.withAllGrammars
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
          # Show marks
          marks-nvim
          # auto parenthesis
          nvim-autopairs
          # Let's try to write something..
          vimwiki
          # Preview markdown files
          markdown-preview-nvim
          # An experimental neovim plugin I created, I don't really use this :D
          clojure-test-tree-nvim
        ];
        additionalDeps = with pkgs; [
          # Required by telescope plugin for fuzzy finding
          ripgrep
          git
          # Required by nix language server (nil)
          nix
          lua-language-server
          basedpyright
        	nodePackages.typescript-language-server
          clojure-lsp
          haskellPackages.haskell-language-server
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
        devShells.default = pkgs.mkShell {
          packages = [additionalDeps];
          shellHook = '' 
            echo "Hello"
          '';
        };
        packages.default = pkgs.writeShellApplication {
          name = "myvim";
          runtimeInputs = [
            myNeovim 
            nil 
            zls
          ] ++ additionalDeps;
          text = ''
            nvim "$@"
          '';
        };
      }
    );
}
