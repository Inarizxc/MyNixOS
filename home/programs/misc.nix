{ pkgs, ... }:
{
  programs = {
    zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };
    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };
    direnv = {
      enable = true;
      enableNushellIntegration = true;
    };
    imv.enable = true;
    bottom.enable = true;
    skim.enable = true;
  };
}
