{ config, ... }:
{
  gtk = {
    enable = true;
    theme.name = "Catppuccin-Purple-Dark";
    gtk4.theme = config.gtk.theme;
    gtk2.extraConfig = ''
      gtk-theme-name = "Catppuccin-Purple-Dark"
    '';
  };

  xdg.configFile."gtk-4.0/gtk.css".source = ../.themes/Catppuccin-Purple-Dark/gtk-4.0/gtk.css;
}
