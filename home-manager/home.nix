{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules/bundle.nix
    ./programs/bundle.nix
  ];
  home = let
    homeDir = config.home.homeDirectory;
  in {
    username = "inari";
    homeDirectory = "/home/inari";

    stateVersion = "25.11";

    file.".steam/root/compatibilitytools.d/Proton-GE".source = pkgs.proton-ge-bin.steamcompattool;

    shell.enableNushellIntegration = true;

    sessionVariables = {
      EDITOR = "hx";
      BROWSER = "zen-beta";
      TERMINAL = "ghostty";
      VISUAL = "${homeDir}/.config/emacs/bin/doom emacs";
      NH_FLAKE = "${homeDir}/NixOS";
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "${homeDir}/.steam/root/compatibilitytools.d";
      SSH_ASKPASS = null;
    };
    enableNixpkgsReleaseCheck = false;
  };

  programs.home-manager.enable = true;
}
