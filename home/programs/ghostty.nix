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
      app-notifications = "no-clipboard-copy";
      cursor-click-to-move = true;
    };
  };
}
