{ ... }:
{
  programs.ghostty = {
    enable = true;
    installVimSyntax = true;
    settings = {
      theme = "catppuccin-mocha";
      font-size = "18";
      confirm-close-surface = false;
      keybind = [
        "ctrl+h=previous_tab"
        "ctrl+l=next_tab"        
      ];
    };
  };
}
