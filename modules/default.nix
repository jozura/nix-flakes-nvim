{pkgs, ...}:
with pkgs.lib.attrsets;
with pkgs.lib.lists;
with pkgs.lib.strings;
with builtins;
with pkgs; let
  modulesPath = ./.;
  getConfigPath = moduleName: "${modulesPath}/${moduleName}";
  mkConfigDerivation = moduleName:
    stdenv.mkDerivation {
      name = moduleName;
      src = getConfigPath moduleName;
      installPhase = ''
        mkdir -p $out/
        cp ./* $out/
      '';
    };
  filterDirContents = path: type: (attrNames (filterAttrs
    (k: v: v == type)
    (readDir path)));

  # Get all directories from current path
  modules = filterDirContents modulesPath "directory";
  # Copy the config files to nix store
  configDerivations =
    map (moduleName: (mkConfigDerivation moduleName)) modules;
  # Get the complete nix store path for each config file
  configFilePaths = flatten (
    map
    (derivation:
      map
      (fileName: "${derivation}/${fileName}")
      (filterDirContents "${derivation}" "regular"))
    configDerivations
  );

  # Filter out .lua and .vim files
  luaRCPaths = filter (path: hasSuffix "lua" path) configFilePaths;
  vimRCPaths = filter (path: hasSuffix "vim" path) configFilePaths;
  # Write the customRC that sources both types of config files
  luaRC = map (path: "luafile ${path}") luaRCPaths;
  vimRC = map (path: "source ${path}") vimRCPaths;
  customRC = concatStringsSep "\n" (luaRC ++ vimRC);
in {
  inherit customRC;
}
