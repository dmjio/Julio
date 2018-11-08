{ compiler ? "ghc843"
, rev ? "ac7bf94f6df"
, sha256 ? "0qd9alwam69pd8s6c7pz5abpl7prxm9bbd6yrmimcp7xyab70sy7"
, pkgs ? import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    inherit sha256;
  }) {}
}:
with pkgs;
with pkgs.haskell.lib;
let
  julio = pkgs.haskellPackages.callPackage ./pkg.nix {};
in
  addExtraLibrary julio julia
