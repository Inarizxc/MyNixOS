{ catppuccin, ... }:
{
  catppuccin = {
    tty.enable = true;
    limine.enable = true;
    plymouth.enable = true;
  };

  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      limine.enable = true;
    };
    plymouth.enable = true;
  };
}
