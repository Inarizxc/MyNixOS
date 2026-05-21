{
  appimageTools,
  fetchurl,
  ...
}:
let
  pname = "xmcl";
  version = "0.56.1";

  src = fetchurl {
    url = "https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${version}/xmcl-${version}-x86_64.AppImage";
    hash = "sha256-X42CRgFWvnl6zGaovWvmzVJSeD1VVfbLRGMFTz48pb4=";
  };

  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands =
    # BASH
    ''
      mkdir -p $out/share/applications $out/share/pixmaps
      cp ${appimageContents}/xmcl.png $out/share/pixmaps/

      substitute ${appimageContents}/xmcl.desktop $out/share/applications/xmcl.desktop \
         --replace 'Exec=AppRun' 'Exec=nvidia-offload gamemoderun xmcl'
    '';
}
