{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore-lto-x86_64-v3;

    kernel.sysctl = {
      "vm.swappiness" = 20;
      "vm.vfs_cache_pressure" = 50;
    };

    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "uas"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [
        "nvidia-uvm"
      ];
    };
    kernelModules = ["kvm-amd"];
    blacklistedKernelModules = ["tdx"];
    extraModulePackages = [];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/78657e37-f633-480f-9ff6-1172f749eacc";
      fsType = "ext4";
      options = ["noatime"];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/AA5A-6F14";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/f294c9c7-b577-4ec6-9bad-e6b7111773d6";}
  ];

  security = {
    sudo-rs.enable = true;
    polkit.enable = true;
  };
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      package = pkgs.bluez-experimental;
      settings = {
        General = {
          Experimental = true;
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;

      modesetting.enable = true;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };

        amdgpuBusId = "PCI:5:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

  services.xserver.videoDrivers = ["nvidia"];
}
