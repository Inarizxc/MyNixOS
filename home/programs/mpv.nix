{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      uosc
      thumbfast
      sponsorblock
    ];

    config = {
      osc = "no";
      border = "no";
      osd-bar = "no";

      vo = "gpu";
      gpu-api = "opengl";
      gpu-context = "wayland";

      save-position-on-quit = "yes";
      force-window = "immediate";

      slang = "ru,en";
      sub-visibility = "no";
    };
  };
}
