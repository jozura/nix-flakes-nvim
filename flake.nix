{
  description = "My neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    wgsl-analyzer-flake.url = "github:wgsl-analyzer/wgsl-analyzer/a54d6a959518319655c1645d1212747e3b065e8a";
    nil-flake.url = "github:oxalica/nil";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    wgsl-analyzer-flake,
    nil-flake,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        wgsl-analyzer = wgsl-analyzer-flake.packages.${system}.default;
        nil = nil-flake.packages.${system}.nil;
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
            (ps: with ps; [nix lua clojure javascript typescript css scss html json sql yaml python regex glsl wgsl zig]))
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
          # auto parenthesis
          nvim-autopairs
        ];
        additionalDeps = with pkgs; [
          # Required by telescope plugin for fuzzy finding
          ripgrep
          git
          # Required by nix language server (nil)
          nix
          # Language servers (that have no flakes)
          lua-language-server
          basedpyright
        	nodePackages.typescript-language-server
          zls
          clojure-lsp
          haskellPackages.haskell-language-server
        ];
        luaConfig = (import ./lua) pkgs;
        alpineImage = pkgs.dockerTools.pullImage {
          imageName = "alpine";
          imageDigest = "sha256:34871e7290500828b39e22294660bee86d966bc0017544e848dd9a255cdf59e0";
          sha256 = "0z8vhhr9sqb9mpnczdjqhhg2rka7zv2k4vcm7kymb3il50bqhqdg";
        };
        nonRootShadowSetup = { user, uid, gid ? uid }: with pkgs; [
          (
          writeTextDir "etc/shadow" ''
            root:!x:::::::
            ${user}:!:::::::
          ''
          )
          (
          writeTextDir "etc/passwd" ''
            root:x:0:0::/root:${runtimeShell}
            ${user}:x:${toString uid}:${toString gid}::/home/${user}:
          ''
          )
          (
          writeTextDir "etc/group" ''
            root:x:0:
            ${user}:x:${toString gid}:
          ''
          )
          (
          writeTextDir "etc/gshadow" ''
            root:x::
            ${user}:x::
          ''
          )
        ];
        myNeovim = pkgs.wrapNeovim pkgs.neovim-unwrapped {
          configure = {
            packages.myVimPackage = {
              start = startPlugins;
              opt = [];
            };
            customRC = luaConfig.customRC;
          };
        };
      in rec {
        packages.default = pkgs.writeShellApplication {
          name = "myvim";
          runtimeInputs = [
            myNeovim 
            nil 
            wgsl-analyzer
          ] ++ additionalDeps;
          text = ''
            nvim "$@"
          '';
        };
        
        # TODO: Refactor docker stuff into own file
        packages.dockerImage = pkgs.dockerTools.streamLayeredImage {
          fromImage = alpineImage;
          name = "myvim";
          tag = "1.0";
          created = "now";
          # uid/gid has to be same as host users
          contents = nonRootShadowSetup {uid = 1000; user = "jozura";};
          fakeRootCommands = ''
            mkdir -p home/jozura
            chown 1000 ./home/jozura
            mkdir -p home/jozura/workdir
          '';
          config = {
            Entrypoint = ["${packages.default}/bin/myvim"];
            WorkingDir = "/workdir";
            User = "jozura";
            # Fix colors when running inside tmux
            Env = ["TERM=screen"];
          };
        };

        packages.withoutNetwork = pkgs.writeShellApplication {
            name = "dvim";
            runtimeInputs = [ pkgs.docker ];
            text = ''
              if ! docker images | grep -q "^myvim\s*1.0\s"; then
                ${packages.dockerImage} | docker load
              fi
              if [ "$#" -lt 1 ]; then
                docker run -it --rm --network none -v "$(pwd)":/workdir myvim:1.0
              else
                absolute_path=$(realpath "$1")
                if [ -d "$absolute_path" ]; then
                  docker run -it --rm --network none -v "$absolute_path":/workdir myvim:1.0
                else
                  dirname=$(dirname "$absolute_path")
                  filename=$(basename "$absolute_path")
                  docker run -it --rm --network none -v "$dirname":/workdir myvim:1.0 "$filename"
                fi
              fi
            '';
        };
      }
    );
}
