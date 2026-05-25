{ config, pkgs, ... }:

let
  homeDir = "/home/inari/NixOS/conf/modules/zapret/";
in
{

  networking.nftables.enable = true;

  systemd.services.zapret = {
    enable = true;
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    description = "Custom Script Service";
    path = with pkgs; [
      sudo
      git
      nftables
      iproute2
      coreutils
      curl
    ];
    serviceConfig = {
      Type = "simple";
      WorkingDirectory = "${homeDir}/.shared/zapret/";
      User = "root";
      ExecStart = ''
        ${pkgs.bash}/bin/bash ${homeDir}/.shared/zapret/service.sh run --config conf.env
      '';
      KillMode = "control-group";
      TimeoutStopSec = "10s";
      ExecStopPost = ''
        ${pkgs.coreutils}/bin/echo  "Сервис завершён"
      '';
      PIDFile = ''
        /run/zapret_discord_youtube.pid
      '';
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };
}
