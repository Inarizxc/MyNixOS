{ stdenvNoCC, fetchurl, ... }:
stdenvNoCC.mkDerivation {
  pname = "rmt";
  version = "0.2.1";
  src = fetchurl {
    url = "https://github.com/AmineZouitine/rmt.rs/releases/download/0.2.1/rmt-x86_64-unknown-linux-gnu.tar.gz";
    sha256 = "sha256-DoBpWdLm6C1pcC65hZ+QMam7oY52moabMPXU5bU+ACI=";
  };

  dontUnpack = true;

  installPhase = # Bash
    ''
      mkdir -p $out/bin
      tar xf $src -C $out/bin
    '';
}
