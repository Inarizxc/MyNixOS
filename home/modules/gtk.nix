{config, ...}: {
  gtk = {
    enable = true;
    theme.name = "adw-gtk3";
    gtk4.theme = config.gtk.theme;
    gtk2.extraConfig = ''
      gtk-theme-name = "adw-gtk3"
    '';
  };
}
