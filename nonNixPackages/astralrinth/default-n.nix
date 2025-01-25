{
  stdenv,
  dpkg,
  makeWrapper,
  fontconfig,
  pkg-config,
  freetype,
  ...
}:
stdenv.mkDerivation {
  pname = "ModrinthApp";
  version = "0.9.2";

  src = ./files;

  nativeBuildInputs = [dpkg];
  propagatedNativeBuildInputs = [makeWrapper];
  buildInputs = [
    fontconfig
    pkg-config
  ];

  installPhase = ''
    mkdir -p $out
    mkdir -p $TMP/arf

    dpkg-deb -x $src/AstralRinth.App_0.9.204_amd64.deb  $TMP/arf

    cp -r $TMP/arf/usr/* $out/

    cp -r $src/lib/ $out/

    wrapProgram $out/bin/ModrinthApp \
      --set LD_LIBRARY_PATH "${
      builtins.concatStringsSep ":" [
        "${fontconfig}/lib"
        "${freetype}/lib"
        "${pkg-config}/lib"
        "$out/lib"
      ]
    }"
  '';
}
