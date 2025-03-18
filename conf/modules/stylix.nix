{
  pkgs,
  stylix,
  ...
}: {
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  stylix.autoEnable = true;
  stylix.targets = {
    grub.enable = false;
    plymouth.enable = false;
    console.enable = false;
    gtk.enable = false;
    gnome.enable = false;
  };
}
