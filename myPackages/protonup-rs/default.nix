{
  stdenvNoCC,
  fetchurl,
}:
stdenvNoCC.mkDerivation rec {
  pname = "protonup-rs";
  version = "0.9.0";

  src = fetchurl {
    url = "https://github.com/auyer/Protonup-rs/releases/download/v${version}/protonup-rs-linux-amd64.tar.gz";
    sha256 = "sha256-4+oVqIQAyI182slkoEIcO4ysNRFN/WsG2WrfPgSEITo=";
  };
  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin

    tar xf $src

    cp protonup-rs $out/bin
  '';
}
