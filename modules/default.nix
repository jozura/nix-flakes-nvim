{pkgs, ...}: {
  customRC = (import ./bundleRCFiles.nix) pkgs;
}
