{
  appimageTools,
  fetchurl,
  ...
}: let
  pname = "elyprismlauncher";
  version = "11.1.1";

  src = fetchurl {
    url = "https://github.com/ElyPrismLauncher/Launcher/releases/download/${version}/PineconeMC-Linux-x86_64.AppImage";
    hash = "sha256-bhi0iWH3YKRol1hm5Y552TtWa347aPrAP5oSTQz1wmE=";
  };
in
  appimageTools.wrapType2 {
    inherit pname version src;
  }
