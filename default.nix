{ pkgs ? import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/1a88aa9e0cd.tar.gz";
    sha256 = "076zlppa0insiv9wklk4h45m7frq1vfs43vsa11l8bm5i5qxzk6r";
  }) {}
}:
with pkgs.haskell.lib;
let
  julia_pkgconfig = pkgs.writeTextFile {
    name = "prefix";
    text = ''
      exec_prefix=''${prefix}
      libdir=''${exec_prefix}/lib
      includedir=''${prefix}/include/julia
      Name: Julia
      Description: Julia
      URL: https://julia-lang.org
      Version: 1.1
      Libs: -L''${libdir} -ljulia
      Cflags: -I''${includedir}
      Requires:
   '';
  };
  julia =
    pkgs.lib.overrideDerivation pkgs.julia_11 (drv: {
      postInstall = ''
        mkdir -p $out/lib/pkgconfig
        echo "$out" > $out/lib/pkgconfig/julia.pc
        echo "prefix=$out" >> $out/lib/pkgconfig/julia.pc
        cat ${julia_pkgconfig} >> $out/lib/pkgconfig/julia.pc
      '';
    });
  julio = addExtraLibrary (pkgs.haskellPackages.callPackage ./pkg.nix {
    inherit julia;
  }) pkgs.libuv;
in
  julio

