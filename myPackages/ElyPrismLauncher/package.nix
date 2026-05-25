{
  appimageTools,
  fetchurl,
  ...
}:
let
  pname = "elyprismlauncher";
  version = "11.0.2";

  src = fetchurl {
    url = "https://github.com/ElyPrismLauncher/Launcher/releases/download/${version}/PineconeMC-Linux-x86_64.AppImage";
    hash = "sha256-CfQQRW7WPAfOqMY3EHrPQXdOr5URbHxzP2Cogar0toA=";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;
}
