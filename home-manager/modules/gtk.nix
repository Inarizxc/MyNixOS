{config, ...}: {
  gtk = {
    enable = true;
    font = {
      name = "Maple Mono NF";
      size = 12;
    };
    theme.name = "adw-gtk3";
    gtk4.theme = config.gtk.theme;
    gtk2.extraConfig = ''
      gtk-theme-name="adw-gtk3"
    '';
  };
}
