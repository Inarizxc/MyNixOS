{pkgs, ...}: {
  services.xserver.enable = true;

  # services.displayManager.gdm = {
  #   enable = true;
  #   wayland = true;
  # };
  services.desktopManager.gnome.enable = true;
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  services.gnome.core-apps.enable = false;
  environment.cosmic.excludePackages = [ pkgs.cosmic-store ];
  environment.gnome.excludePackages = [pkgs.gnome-tour];
  services.xserver.excludePackages = [pkgs.xterm];
  services.xserver.desktopManager.xterm.enable = false;
}
