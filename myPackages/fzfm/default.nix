{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  pname = "fzfm";
  version = "93daec4ac806507d11f615f91566b715cc7aee35";
  src = ./fzfm;

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;
  dontCheck = true;
  dontFixup = true;

  installPhase = # Bash
    ''
      mkdir -p $out/bin
      install -Dm755 $src $out/bin/fzfm
    '';
}
