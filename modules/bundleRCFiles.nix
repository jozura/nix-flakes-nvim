{
  pkgs,
  modules,
  ...
}:
with pkgs.lib.attrsets;
with pkgs.lib.lists;
with pkgs.lib.strings;
with pkgs.lib.trivial;
with builtins;
with pkgs; let
  modulesPath = ./.;

  # Helper functions
  prependCurrPath = currPath: name: "${currPath}/${name}";
  filterFiles = type: directoryContents:
    attrNames (filterAttrs (k: v: v == type) directoryContents);
  flatMap = f: list: flatten (map f list);
  # A function that recursively finds all .lua files in "path"
  getAllLuaFileAbsolutePaths = path: let
    directoryContents = readDir path;
    files = filterFiles "regular" directoryContents;
    luaFiles = filter (fileName: hasSuffix "lua" fileName) files;
    luaFilePaths = map (prependCurrPath path) luaFiles;
    directories = filterFiles "directory" directoryContents;
    directoryPaths = map (prependCurrPath path) directories;
  in
    luaFilePaths ++ (flatMap getAllLuaFileAbsolutePaths directoryPaths);

  # Copy the modules folder into nix store
  modulesDerivation = stdenv.mkDerivation {
    name = "lua-config-nvim";
    src = modulesPath;
    installPhase = ''
      mkdir -p $out/
      cp -r ./* $out/
    '';
  };

  # Get the nix store path of all lua files so that they can be set in the
  # $LUA_PATH environment variable. This makes it possible to 'require' them
  # from ./init.lua
  # luaFilePaths = getAllLuaFileAbsolutePaths "${modulesDerivation}";
  tmp = map (mod: "${mod}/?.lua") (filterFiles "directory" (readDir ./.));
  luaPath = concatStringsSep ";" tmp;
  #luaPath = concatStringsSep ";" (map (mod: mod + "${mod}/?.lua") tmp);
  # luaPath = concatStringsSep ";" luaFilePaths;
in {
  # Sets ./init.lua as the entrypoint to my neovim config
  customRC = "luafile ${modulesDerivation}/init.lua";
  luaPath = "${luaPath}";
  # luaPath = "${modulesDerivation}";
}
