{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
    desktopManager.xterm.enable = false;
  };

  services = {
    desktopManager = {
      cosmic = {
        enable = true;
        xwayland.enable = true;
        showExcludedPkgsWarning = false;
      };
    };
    displayManager.cosmic-greeter.enable = true;
  };

  environment.cosmic.excludePackages = [ pkgs.cosmic-applibrary ];

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "com.mitchellh.ghostty.desktop"
      ];
    };
  };
}
