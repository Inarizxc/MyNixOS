{
  stdenv,
  fetchurl,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "rawst";
  version = "0.8.1";
  src = fetchurl {
    url = "https://github.com/Jupiee/rawst/releases/download/${finalAttrs.version}/rawst-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-3IO0nLT/buazGYVBKzQJ+EPrT8lGtIZ9vFjOK0NGtDw=";
  };
  
  dontBuild = true;
  dontConfigure = true;
  dontUnpack = true;
  
  installPhase = ''
      mkdir -p $out/bin

      tar -xf $src -C $out/bin

      chmod +x $out/bin/rawst
    '';
})
