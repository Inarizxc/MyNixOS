{...}: {
  gtk = { 
    enable = true;
    iconTheme.name = "Papirus-Dark";
    theme.name = "Catppuccin-Purple-Dark"; 
  };

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "Vitals@CoreCoding.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "clipboard-indicator@tudmotu.com"
        "dash-to-dock@micxgx.gmail.com"
        "gsconnect@andyholmes.github.io"
        "rounded-window-corners@fxgn"
        "solaar-extension@sidevesh"
        "space-bar@luchrioh"
        "just-perfection-desktop@just-perfection"
        "quick-settings-tweaks@qwreey"
      ];
    };
  };
}
