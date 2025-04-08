{catppuccin, ...}: {
  catppuccin = {
    tty.enable = true;
    grub.enable = true;
    plymouth.enable = true;
  };

  boot.loader = {
    # systemd-boot.enable = true;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      devices = ["nodev"];
      enable = true;
      efiSupport = true;
      useOSProber = false;
      configurationLimit = 10;
      copyKernels = true;
    };
  };
  boot.plymouth.enable = true;
}
