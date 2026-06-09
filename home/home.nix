{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
    
    ./modules/bundle.nix
    ./programs/bundle.nix
  ];
  home = let
    homeDir = config.home.homeDirectory;
  in {
    username = "inari";
    homeDirectory = "/home/inari";

    stateVersion = "25.11";

    file = {
      ".cache/devenv/hook.nu".source = pkgs.runCommand "devenv-nu-hook" {nativeBuildInputs = [pkgs.devenv];} ''
        devenv hook nu > $out
      '';
    };

    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "${homeDir}/.config/emacs/bin/doom emacs";
      NH_FLAKE = "${homeDir}/NixOS";
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "${homeDir}/.steam/root/compatibilitytools.d";
    };
    enableNixpkgsReleaseCheck = false;
  };

  programs.home-manager.enable = true;
}
