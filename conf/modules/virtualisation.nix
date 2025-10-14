{ pkgs, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
    allowedBridges = [
      "nm-bridge"
      "virbr0"
    ];
  };

  systemd.tmpfiles.rules =
    let
      firmware = pkgs.runCommandLocal "qemu-firmware" { } ''
        mkdir $out
        cp ${pkgs.qemu}/share/qemu/firmware/*.json $out
        substituteInPlace $out/*.json --replace ${pkgs.qemu} /run/current-system/sw
      '';
    in
    [ "L+ /var/lib/qemu/firmware - - - - ${firmware}" ];
}
