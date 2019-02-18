{ mkDerivation, base, julia, stdenv }:
mkDerivation {
  pname = "julio";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base ];
  librarySystemDepends = [ julia ];
  executableHaskellDepends = [ base ];
  homepage = "github.com/dmjio/julio";
  description = "Haskell meets Julia";
  license = stdenv.lib.licenses.bsd3;
}
