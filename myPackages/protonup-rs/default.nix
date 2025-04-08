{
  stdenv,
  fetchurl,
}:
stdenv.mkDerivation rec {
  pname = "protonup-rs";
  version = "0.8.5";

  src = fetchurl {
    url = "https://github.com/auyer/Protonup-rs/releases/download/v${version}/protonup-rs-linux-amd64.tar.gz";
    sha256 = "sha256-sqeyKH+cdNq+jP9ss70AJsp2cl6sOrFHpr6tDljtYqY=";
  };
  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin

    tar xf $src

    cp protonup-rs $out/bin
  '';
}
