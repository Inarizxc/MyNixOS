{
  appimageTools,
  fetchurl,
  ...
}: let
  pname = "elyprismlauncher";
  version = "11.0.3";

  src = fetchurl {
    url = "https://github.com/ElyPrismLauncher/Launcher/releases/download/${version}/PineconeMC-Linux-x86_64.AppImage";
    hash = "sha256-32lY+6k8l6psuBUNPTqCis4NO6Lq384wNWXRuQPQSiA=";
  };
in
  appimageTools.wrapType2 {
    inherit pname version src;
  }
