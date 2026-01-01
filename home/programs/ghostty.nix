{ ... }:
{
  programs.ghostty = {
    enable = true;
    installVimSyntax = true;
    settings = {
      theme = "catppuccin-mocha";
      font-size = 18;
      confirm-close-surface = false;
      background-blur = true;
      background-opacity = 0.95;
    };
  };
}
