{ stdenv }:
stdenv.mkDerivation {
	pname = "catnap";
	version = "2623f97443b21fae3fd6a2974f6ce3a12d4c6ca6";
	src = ./bin;

	dontCheck = true;
	dontUnpack = true;
	doBuild = false;

	installPhase = ''
		mkdir -p $out/bin
		cp $src/catnap $out/bin
	'';
}
