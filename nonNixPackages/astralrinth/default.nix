{
  appimageTools,
  fetchurl,
  ...
}: let
  pname = "ModrinthApp";
  version = "0.9.3";

  src = fetchurl {
    url = "https://github.com/DIDIRUS4/AstralRinth/releases/download/ARF-v${version}/AstralRinth.App_0.9.301_amd64.AppImage";
    hash = "sha256-Y/DxQCEC7uXIP24MiskR0tBdD16od5odnaWc/VRS07Y=";
  };

  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };
in
  appimageTools.wrapType2 rec {
    inherit pname version src;

    extraInstallCommands = ''
      mkdir -p $out/share/applications $out/share/pixmaps
      # cp ${appimageContents}/AstralRinth\ App.desktop $out/share/applications/
      cp ${appimageContents}/AstralRinth\ App.png $out/share/pixmaps/

      touch $out/share/applications/AstralRinth\ App.desktop

      cat > $out/share/applications/AstralRinth\ App.desktop <<EOF
      [Desktop Entry]
      Categories=Game;
      Exec=nvidia-offload ModrinthApp
      Icon=$out/share/pixmaps/AstralRinth\ App.png
      Name=AstralRinth App
      Terminal=false
      Type=Application
      MimeType=application/zip+mrpack;x-scheme-handler/modrinth
      EOF

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
