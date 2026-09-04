{
  services = {
    ratbagd.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    fstrim = {
      enable = true;
      interval = "weekly";
    };
    zapret-rust = {
      enable = true;
      gamefilterTcp = true;
      gamefilterUdp = true;
      interface = "any";
      strategy = "general (ALT9).bat";
      backend = "nftables";
    };
  };
}
