{pkgs, ...}: {
  users.users.inari = {
    isNormalUser = true;
    description = "Maxim";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
    ];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;
}
