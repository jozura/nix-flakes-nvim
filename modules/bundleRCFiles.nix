{
  pkgs,
  modules,
  ...
}:
with pkgs.lib.attrsets;
with pkgs.lib.lists;
with pkgs.lib.strings;
with builtins;
with pkgs; let
  modulesPath = ./.;
  getConfigPath = module: "${modulesPath}/${module}";
  # A helper function to get the names of all files of a certain
  # type. E.g "regular" or "directory"
  filterDirContents = path: type: (attrNames (filterAttrs
    (k: v: v == type)
    (readDir path)));

  # Get the names of all directories (modules) in the modules path (./)
  # Get full path to the config directory for each module
  configDirPaths = map (moduleName: getConfigPath moduleName) modules;
  # Form the complete path to each file in each config directory
  configFilePaths = flatten (
    map
    (configPath:
      map
      (fileName: "${configPath}/${fileName}")
      (filterDirContents "${configPath}" "regular"))
    configDirPaths
  );
  # Filter out .lua and .vim files
  luaRCPaths = filter (path: hasSuffix "lua" path) configFilePaths;
  vimRCPaths = filter (path: hasSuffix "vim" path) configFilePaths;
  # Write the customRC config that sources both types of config files
  luaRC = map (path: "luafile ${path}") luaRCPaths;
  vimRC = map (path: "source ${path}") vimRCPaths;
in
  concatStringsSep "\n" (luaRC ++ vimRC)
