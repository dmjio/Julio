{ mkDerivation, base, bytestring, julia, stdenv }:
mkDerivation {
  pname = "julio";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base bytestring ];
  executableHaskellDepends = [ base ];
  executableSystemDepends = [ julia ];
  homepage = "github.com/dmjio/julio";
  description = "Haskell meets Julia";
  license = stdenv.lib.licenses.bsd3;
}
