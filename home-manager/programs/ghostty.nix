{
  programs.ghostty = {
    enable = true;
    installVimSyntax = true;
    settings = {
      theme = "catppuccin-mocha";
      font-family = "Maple Mono NF";
      font-size = 19;
      confirm-close-surface = false;
      app-notifications = "no-clipboard-copy";
      cursor-click-to-move = true;
      background-blur = true;
      background-opacity = 0.9;
    };
  };
}
