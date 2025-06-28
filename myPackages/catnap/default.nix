{ stdenvNoCC }:
stdenvNoCC.mkDerivation {
  pname = "catnap";
  version = "2623f97443b21fae3fd6a2974f6ce3a12d4c6ca6";
  src = ./catnap;

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;
  dontCheck = true;
  dontFixup = true;

  installPhase = ''
    		mkdir -p $out/bin
    		install -Dm755 $src $out/bin/catnap
    	'';
}
