let
  p = (import ./default.nix {}).env;
  pkgs = import <nixpkgs> {};
in
  p.overrideAttrs (drv: {
    buildInputs = drv.buildInputs ++ [ pkgs.pkgconfig ];
  })

