{ config, ... }:
{
  xdg = {
    desktopEntries.emacs = {
      name = "Doom Emacs";
      exec = "${config.home.homeDirectory}/.config/emacs/bin/doom emacs %F";
      terminal = false;
      mimeType = [
        "text/plain"
        "text/x-python"
      ];
    };
    terminal-exec = {
      enable = true;
      settings = {
        default = [ "com.mitchellh.ghostty.desktop" ];
      };
    };
    portal.config.common = {
    default = [ "gnome" "gtk" ];
    "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    "org.freedesktop.impl.portal.Access" = [ "gtk" ];
    "org.freedesktop.impl.portal.Notification" = [ "gtk" ];
  };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/json" = [ "emacs.desktop" ];
        "application/pdf" = [ "org.gnome.Papers.desktop" ];
        "application/x-extension-htm" = [ "zen-beta.desktop" ];
        "application/x-extension-html" = [ "zen-beta.desktop" ];
        "application/x-extension-shtml" = [ "zen-beta.desktop" ];
        "application/x-extension-xht" = [ "zen-beta.desktop" ];
        "application/x-extension-xhtml" = [ "zen-beta.desktop" ];
        "application/x-terminal-emulator" = [ "com.mitchellh.ghostty.desktop" ];
        "application/x-zerosize" = [ "emacs.desktop" ];
        "application/xhtml+xml" = [ "zen-beta.desktop" ];
        "text/html" = [ "zen-beta.desktop" ];
        "text/plain" = [ "emacs.desktop" ];
        "x-scheme-handler/chrome" = [ "zen-beta.desktop" ];
        "x-scheme-handler/http" = [ "zen-beta.desktop" ];
        "x-scheme-handler/https" = [ "zen-beta.desktop" ];
        "x-scheme-handler/terminal" = [ "com.mitchellh.ghostty.desktop" ];
        "x-scheme-handler/tg" = [ "userapp-AyuGram Desktop-FR9OG3.desktop" ];
        "x-scheme-handler/tonsite" = [ "userapp-AyuGram Desktop-QKJQG3.desktop" ];
        "x-scheme-handler/magnet" = [ "userapp-transmission-gtk-UCGVF3.desktop" ];
        "x-scheme-handler/mailto" = [ "userapp-Thunderbird-VLCUG3.desktop" ];
        "message/rfc822" = [ "userapp-Thunderbird-VLCUG3.desktop" ];
        "x-scheme-handler/mid" = [ "userapp-Thunderbird-VLCUG3.desktop" ];
        "x-scheme-handler/discord" = [ "vesktop.desktop" ];
        "x-scheme-handler/discord-455712169795780630" = [ "discord-455712169795780630.desktop" ];
      };
      associations.added = {
        "application/json" = [
          "dev.zed.Zed.desktop"
          "org.gnome.gedit.desktop"
          "emacsclient.desktop"
          "emacs.desktop"
        ];
        "application/pdf" = [ "org.gnome.Papers.desktop" ];
        "application/x-extension-htm" = [ "zen-beta.desktop" ];
        "application/x-extension-html" = [ "zen-beta.desktop" ];
        "application/x-extension-shtml" = [ "zen-beta.desktop" ];
        "application/x-extension-xht" = [ "zen-beta.desktop" ];
        "application/x-extension-xhtml" = [ "zen-beta.desktop" ];
        "application/x-zerosize" = [
          "org.gnome.Showtime.desktop"
          "emacs.desktop"
        ];
        "application/xhtml+xml" = [
          "zen.desktop"
          "firefox.desktop"
          "zen-beta.desktop"
        ];
        "text/html" = [
          "zen.desktop"
          "firefox.desktop"
          "zen-beta.desktop"
        ];
        "text/plain" = [
          "org.gnome.gedit.desktop"
          "emacs.desktop"
        ];
        "x-scheme-handler/chrome" = [ "zen-beta.desktop" ];
        "x-scheme-handler/http" = [
          "zen-beta.desktop"
          "zen.desktop"
          "firefox.desktop"
        ];
        "x-scheme-handler/https" = [
          "zen-beta.desktop"
          "zen.desktop"
          "firefox.desktop"
        ];
        "x-scheme-handler/sms" = [ "org.gnome.Shell.Extensions.GSConnect.desktop" ];
        "x-scheme-handler/tel" = [ "org.gnome.Shell.Extensions.GSConnect.desktop" ];
        "x-scheme-handler/tg" = [
          "org.telegram.desktop.desktop"
          "io.github.kotatogram.desktop"
          "userapp-AyuGram Desktop-FR9OG3.desktop"
        ];
        "x-scheme-handler/tonsite" = [
          "org.telegram.desktop.desktop"
          "userapp-AyuGram Desktop-QKJQG3.desktop"
        ];
        "x-scheme-handler/magnet" = [ "userapp-transmission-gtk-UCGVF3.desktop" ];
        "x-scheme-handler/mailto" = [ "userapp-Thunderbird-VLCUG3.desktop" ];
        "x-scheme-handler/mid" = [ "userapp-Thunderbird-VLCUG3.desktop" ];
      };
    };
  };
}
