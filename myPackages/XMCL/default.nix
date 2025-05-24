{
  appimageTools,
  fetchurl,
  ...
}: let
  pname = "xmcl";
  version = "0.50.5";

  src = fetchurl {
    url = "https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${version}/xmcl-${version}-x86_64.AppImage";
    hash = "sha256-MOvbJerrtKDg61sicuQ8YzQ5gGIVe0tuSE73VA4IyL4=";
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
        cp ${appimageContents}/xmcl.png $out/share/pixmaps/

        substitute ${appimageContents}/xmcl.desktop $out/share/applications/xmcl.desktop \
           --replace 'Exec=AppRun' 'Exec=nvidia-offload gamemoderun xmcl'
      '';
  }
