{ ... }:
{
  programs.ghostty = {
    enable = true;
    installVimSyntax = true;
    settings = {
      theme = "catppuccin-mocha";
      font-family = "Iosevka Nerd Font";
      font-size = 20;
      confirm-close-surface = false;
      background-blur = true;
      background-opacity = 0.95;
      app-notifications = "no-clipboard-copy";
    };
  };
}
