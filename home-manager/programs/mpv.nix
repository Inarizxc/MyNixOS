{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      uosc
      thumbfast
      sponsorblock
      chapterskip
    ];

    scriptOpts = {
      thumbfast = {
        network = "yes";
      };

      chapterskip = {
        skip-op = "yes";
        skip-ed = "yes";
      };
    };

    config = {
      osc = "no";
      border = "no";
      osd-bar = "no";

      vo = "gpu-next";
      gpu-api = "vulkan";
      gpu-context = "waylandvk";
      hwdec = "nvdec-copy";

      profile = "gpu-hq";
      dither-depth = "auto";

      video-sync = "display-resample";
      interpolation = "yes";

      ao = "pipewire";
      volume = 100;
      speed = 2;

      cache = "yes";
      cache-secs = 120;
      demuxer-max-bytes = "800Mib";
      demuxer-max-back-bytes = "200Mib";

      save-position-on-quit = "yes";
      force-window = "immediate";
      watch-later-options = "start,mute,volume,pause";

      ytdl-format = "bestvideo[height<=?1080][vcodec!=?av01]+bestaudio/best";
      ytdl-raw-options = "sub-langs=ru";

      slang = "ru,en";
      sub-font = "Iosevka Nerd Font";
      sub-font-size = 40;
      sub-visibility = "no";
    };
  };
}
