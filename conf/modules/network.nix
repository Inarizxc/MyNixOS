{...}: {
  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  networking.firewall = rec {
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPorts = [5900];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
}
