{
  config,
  pkgs,
  ...
}: {
  xdg = {
    desktopEntries = let
      open-in-ghostty = pkgs.writeShellScript "open-in-ghostty" ''
        exec ghostty --working-directory="$1"
      '';
    in {
      emacs = {
        name = "Doom Emacs";
        exec = "${config.home.homeDirectory}/.config/emacs/bin/doom emacs %F";
        terminal = false;
        mimeType = [
          "text/plain"
          "text/x-python"
        ];
      };
      open-in-ghostty = {
        name = "Open in Ghostty";
        exec = "${open-in-ghostty} %f";
        mimeType = ["inode/directory"];
        terminal = false;
        icon = "utilities-terminal";
      };
    };
    terminal-exec = {
      enable = true;
      settings = {
        default = ["com.mitchellh.ghostty.desktop"];
      };
    };
    portal.config.common = {
      default = ["gnome" "gtk"];
      "org.freedesktop.impl.portal.FileChooser" = ["gtk"];
      "org.freedesktop.impl.portal.Access" = ["gtk"];
      "org.freedesktop.impl.portal.Notification" = ["gtk"];
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = ["open-in-ghostty.desktop"];
        "application/json" = ["Helix.desktop"];
        "application/pdf" = ["org.pwmt.zathura.desktop"];
        "application/x-extension-htm" = ["zen-beta.desktop"];
        "application/x-extension-html" = ["zen-beta.desktop"];
        "application/x-extension-shtml" = ["zen-beta.desktop"];
        "application/x-extension-xht" = ["zen-beta.desktop"];
        "application/x-extension-xhtml" = ["zen-beta.desktop"];
        "application/x-terminal-emulator" = ["com.mitchellh.ghostty.desktop"];
        "application/x-zerosize" = ["Helix.desktop"];
        "application/xhtml+xml" = ["zen-beta.desktop"];
        "application/xml" = ["Helix.desktop"];
        "text/html" = ["zen-beta.desktop"];
        "text/plain" = ["Helix.desktop"];
        "text/x-python" = ["Helix.desktop"];
        "text/x-rust" = ["Helix.desktop"];
        "text/x-go" = ["Helix.desktop"];
        "text/x-shellscript" = ["Helix.desktop"];
        "text/x-nix" = ["Helix.desktop"];
        "x-scheme-handler/chrome" = ["zen-beta.desktop"];
        "x-scheme-handler/http" = ["zen-beta.desktop"];
        "x-scheme-handler/https" = ["zen-beta.desktop"];
        "x-scheme-handler/terminal" = ["com.mitchellh.ghostty.desktop"];
        "x-scheme-handler/tg" = ["userapp-AyuGram Desktop-FR9OG3.desktop"];
        "x-scheme-handler/tonsite" = ["userapp-AyuGram Desktop-QKJQG3.desktop"];
        "x-scheme-handler/magnet" = ["org.qbittorrent.qBittorrent.desktop"];
        "x-scheme-handler/mailto" = ["userapp-Thunderbird-VLCUG3.desktop"];
        "message/rfc822" = ["userapp-Thunderbird-VLCUG3.desktop"];
        "x-scheme-handler/mid" = ["userapp-Thunderbird-VLCUG3.desktop"];
        "x-scheme-handler/discord" = ["vesktop.desktop"];
        "x-scheme-handler/discord-455712169795780630" = ["discord-455712169795780630.desktop"];
      };
      associations.added = {
        "application/json" = [
          "emacsclient.desktop"
          "emacs.desktop"
        ];
        "application/x-extension-htm" = ["zen-beta.desktop"];
        "application/x-extension-html" = ["zen-beta.desktop"];
        "application/x-extension-shtml" = ["zen-beta.desktop"];
        "application/x-extension-xht" = ["zen-beta.desktop"];
        "application/x-extension-xhtml" = ["zen-beta.desktop"];
        "application/x-zerosize" = [
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
          "emacs.desktop"
        ];
        "x-scheme-handler/chrome" = ["zen-beta.desktop"];
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
        "x-scheme-handler/tg" = [
          "org.telegram.desktop.desktop"
          "userapp-AyuGram Desktop-FR9OG3.desktop"
        ];
        "x-scheme-handler/tonsite" = [
          "org.telegram.desktop.desktop"
          "userapp-AyuGram Desktop-QKJQG3.desktop"
        ];
        "x-scheme-handler/magnet" = ["org.qbittorrent.qBittorrent.desktop"];
        "x-scheme-handler/mailto" = ["userapp-Thunderbird-VLCUG3.desktop"];
        "x-scheme-handler/mid" = ["userapp-Thunderbird-VLCUG3.desktop"];
      };
    };
  };
}
