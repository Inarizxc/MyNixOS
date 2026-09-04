{
  networking = {
    hostName = "nixos";

    networkmanager.enable = true;

    firewall = rec {
      enable = true;
      allowPing = false;
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPorts = [
        5900
        53317
      ];
      allowedTCPPorts = [53317];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };
}
