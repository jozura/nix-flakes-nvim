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

  prependCurrPath = currPath: name: "${currPath}/${name}";
  filterFiles = type: directoryContents:
    attrNames (filterAttrs (k: v: v == type) directoryContents);
  flatMap = f: list: flatten (map f list);
  getAllFilePaths = currPath: let
    directoryContents = readDir currPath;
    files = filterFiles "regular" directoryContents;
    filePaths = map (prependCurrPath currPath) files;
    directories = filterFiles "directory" directoryContents;
    directoryPaths = map (prependCurrPath currPath) directories;
  in
    filePaths ++ (flatMap getAllFilePaths directoryPaths);

  # Copy the modules folder into nix store
  modulesDerivation = stdenv.mkDerivation {
    name = "nvim-modules";
    src = modulesPath;
    installPhase = ''
      mkdir -p $out/
      cp -r ./* $out/
    '';
  };

  filePaths = getAllFilePaths "${modulesDerivation}";
  # Filter out .lua and .vim files
  luaRCPaths = filter (path: hasSuffix "lua" path) filePaths;
  vimRCPaths = filter (path: hasSuffix "vim" path) filePaths;
  # Write the customRC config that sources both types of config files
  luaRC = map (path: "luafile ${path}") luaRCPaths;
  vimRC = map (path: "source ${path}") vimRCPaths;
in {
  customRC = concatStringsSep "\n" (luaRC ++ vimRC);
  path = "${modulesDerivation}/";
}
