{pkgs, ...}: {
  services = {
    ratbagd.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    fstrim = {
      enable = true;
      interval = "weekly";
    };
  };
}
