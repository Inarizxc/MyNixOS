{appimageTools, fetchurl, ...}:
let
  pname = "NeoHtop";
  version = "1.1.2";

  src = fetchurl {
    url = "https://github.com/Abdenasser/neohtop/releases/download/v${version}/NeoHtop_${version}_x86_64.AppImage";
    sha256 = "sha256-j7jswFpHZ2KiGIF3t39aYyGfWRcUwEGo81r8D/JztNQ=";
  };

  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };
in
appimageTools.wrapType2 rec {
  inherit pname version src;

  extraInstallCommands = ''
    mkdir -p $out/share/applications $out/share/pixmaps
    cp ${appimageContents}/NeoHtop.desktop $out/share/applications/
    cp ${appimageContents}/NeoHtop.png $out/share/pixmaps/

    # for n in {16,32,48,64,128}; do
    #   size=$n"x"$n
    #   mkdir -p $out/share/icons/hicolor/$size/apps
    #   file="default"$n".png"
    #   cp -r ${appimageContents}/usr/share/* $out/share/
    # done

    # substituteInPlace $out/share/applications/NeoHtop.desktop \
    #   --replace-fail "Exec=neohtop %u" "Exec=$out/bin/${pname} %u"
  '';
}
