{ ... }:
{
  programs = {
    bottom.enable = true;
    skim.enable = true;
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    eza = {
      enable = true;
      enableFishIntegration = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };
    oh-my-posh = {
      enable = true;
      configFile = "~/.config/oh-my-posh/catppuccin.omp.json";
      enableFishIntegration = true;
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
  };
}
