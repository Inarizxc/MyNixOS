{ ... }:
{
  programs.satty = {
    enable = true;
    settings = {
      general = {
        fullscreen = false;
        early-exit = true;
        copy-command = "wl-copy";
        output-filename = "~/Pictures/Screenshots/%Y_%m_%d-%H:%M:%S.png";
        disable-notifications = true;
        action-on-enter = "save-to-file";
      };
      color-palette = {
        palette = [
          "#89dceb"
          "#f38ba8"
          "#eba0ac"
          "#f5c2e7"
          "#f9e2af"
          "#a6e3a1"
        ];
        custom = [
          "#89dceb"
          "#f38ba8"
          "#eba0ac"
          "#f5c2e7"
          "#f9e2af"
          "#a6e3a1"
        ];
      };
    };
  };
}
