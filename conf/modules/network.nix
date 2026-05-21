{...}: {
  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  networking.firewall = rec {
    enable = true;
    allowPing = false;
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPorts = [5900 53317];
    allowedTCPPorts = [ 53317 ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
}
