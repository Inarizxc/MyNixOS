{ catppuccin, ... }:
{
  catppuccin = {
    tty.enable = true;
    # grub.enable = true;
    limine.enable = true;
    plymouth.enable = true;
  };

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    # grub = {
    #   devices = [ "nodev" ];
    #   enable = true;
    #   efiSupport = true;
    #   useOSProber = false;
    #   configurationLimit = 10;
    #   copyKernels = true;
    # };
    limine.enable = true;
  };
  boot.plymouth.enable = true;
}
