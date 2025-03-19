{
  appimageTools,
  fetchurl,
  ...
}: let
  pname = "xmcl";
  version = "0.49.3";

  src = fetchurl {
    url = "https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${version}/xmcl-${version}-x86_64.AppImage";
    hash = "sha256-KAEQKSSrHMNhtvn66AMFLoyCSC/EiZEII0awlnBdnLw=";
  };

  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };
in
  appimageTools.wrapType2 {
    inherit pname version src;

    extraInstallCommands =
      /*
      BASH
      */
      ''
        mkdir -p $out/share/applications $out/share/pixmaps
        # cp ${appimageContents}/xmcl.desktop $out/share/applications/
        cp ${appimageContents}/xmcl.png $out/share/applications/

        cat > $out/share/applications/xmcl.desktop << "EOF"
        [Desktop Entry]
        Name=X Minecraft Launcher
        Exec=nvidia-offload gamemoderun xmcl
        Terminal=false
        Type=Application
        Icon=xmcl
        StartupWMClass=xmcl
        X-AppImage-Version=0.49.1.1098
        MimeType=x-scheme-handler/xmcl;
        Comment=X Minecraft Launcher - A modern Minecraft launcher
        Categories=Game;
        EOF
      '';
  }
