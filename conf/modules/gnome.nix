{pkgs, ...}: {
  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.wayland = true;

  services.gnome.core-apps.enable = false;
  environment.gnome.excludePackages = [pkgs.gnome-tour];
  services.xserver.excludePackages = [pkgs.xterm];
  services.xserver.desktopManager.xterm.enable = false;
}
