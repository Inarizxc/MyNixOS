{ pkgs, catppuccin, ... }:
{
  catppuccin = {
    sddm.enable = true;
  };

  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
    desktopManager.xterm.enable = false;
  };

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "com.mitchellh.ghostty.desktop"
      ];
    };
  };
}
