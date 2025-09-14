{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
    desktopManager.xterm.enable = false;
  };

  services = {
    desktopManager = {
      gnome = {
        enable = true;
      };
      cosmic = {
        enable = true;
        xwayland.enable = true;
      };
    };
    gnome.core-apps.enable = false;
    displayManager.cosmic-greeter.enable = true;
  };

  environment.gnome.excludePackages = [ pkgs.gnome-tour ];

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "com.system76.CosmicTerm.desktop"
        # "com.mitchellh.ghostty.desktop"
      ];
    };
  };
}
