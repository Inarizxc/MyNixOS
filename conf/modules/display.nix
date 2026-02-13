{ pkgs, catppuccin, ... }:
{
  catppuccin = {
    sddm.enable = true;
  };

  programs = {
    niri.enable = true;
    xwayland = {
      enable = true;
      package = pkgs.xwayland-satellite;
    };
  };

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      desktopManager.xterm.enable = false;
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
