{ pkgs, ... }:
{
  users.users.inari = {
    isNormalUser = true;
    description = "Maxim";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
    ];
    shell = pkgs.nushell;
  };
}
