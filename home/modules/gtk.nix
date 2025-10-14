{ ... }:
{
  gtk = {
    enable = true;
    theme.name = "Catppuccin-Purple-Dark";
    # gtk2.configLocation = ".themes/Catppuccin-Purple-Dark/gtk-2.0/gtkrc";
    gtk2.extraConfig = ''
      gtk-theme-name = "Catppuccin-Purple-Dark"
    '';
  };
}
