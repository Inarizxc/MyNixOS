{
  lib,
  pkgs,
  ...
}: let
  mkMenu = menu: let
    configFile = builtins.toFile "config.yaml" (
      lib.generators.toYAML {} {
        font = "Maple Mono NF 18";
        anchor = "bottom-right";
        background = "#1e1e2ecc";
        color = "#cdd6f4";
        border = "#cba6f7";
        separator = " ➜ ";
        border_width = 2;
        auto_kbd_layout = true;

        inherit menu;
      }
    );
  in
    pkgs.writeShellScriptBin "my-menu" ''
      exec wlr-which-key ${configFile}
    '';
in {
  wayland.windowManager.niri.settings.binds = {
    "Mod+Shift+Slash".show-hotkey-overlay = {};
    "Mod+Return".spawn = "ghostty";
    "Mod+T".spawn = "ghostty";
    "Mod+D".spawn-sh = lib.getExe (mkMenu [
      {
        key = "a";
        desc = "AyuGram";
        cmd = "AyuGram";
      }
      {
        key = "c";
        desc = "Calculator";
        cmd = "noctalia msg panel-toggle yuuto/calculator:panel";
      }
      {
        key = "d";
        desc = "Disks";
        cmd = "noctalia msg panel-toggle aristides/udiskie:manager";
      }
      {
        key = "f";
        desc = "FileManager";
        cmd = "ghostty -e superfile";
      }
      {
        key = "l";
        desc = "LocalSend";
        cmd = "localsend_app";
      }
      {
        key = "t";
        desc = "Thunderbird";
        cmd = "thunderbird";
      }
      {
        key = "v";
        desc = "Vesktop";
        cmd = "vesktop";
      }
      {
        key = "z";
        desc = "ZenBrowser";
        cmd = "zen-beta";
      }
      {
        key = "g";
        desc = "Games";
        submenu = [
          {
            key = "e";
            desc = "ElyPrismLauncher";
            cmd = "elyprismlauncher";
          }
          {
            key = "f";
            desc = "Faugus";
            cmd = "faugus-launcher";
          }
          {
            key = "h";
            desc = "Heroic";
            cmd = "heroic";
          }
          {
            key = "s";
            desc = "Steam";
            cmd = "steam";
          }
        ];
      }
      {
        key = "n";
        desc = "Noctalia";
        submenu = [
          {
            key = "c";
            desc = "Clipboard";
            cmd = "noctalia msg panel-toggle clipboard";
          }
          {
            key = "e";
            desc = "Emoji";
            cmd = "noctalia msg panel-toggle launcher /emo";
          }
          {
            key = "s";
            desc = "Settings";
            cmd = "noctalia msg settings-toggle";
          }
          {
            key = "t";
            desc = "Translator";
            cmd = "noctalia msg panel-toggle launcher \"/tr \"";
          }
        ];
      }
    ]);
    "Mod+X".spawn = ["noctalia" "msg" "panel-toggle" "launcher"];
    "Mod+B".spawn = ["ghostty" "-e" "btm" "-b"];
    "Super+Alt+L".spawn = ["noctalia" "msg" "session" "lock"];

    "Super+Alt+S" = {
      _props.allow-when-locked = true;
      spawn = ["sh" "-c" "pkill orca || exec orca"];
    };
    "XF86AudioRaiseVolume" = {
      _props.allow-when-locked = true;
      spawn = ["noctalia" "msg" "volume-up"];
    };
    "XF86AudioLowerVolume" = {
      _props.allow-when-locked = true;
      spawn = ["noctalia" "msg" "volume-down"];
    };
    "XF86AudioMute" = {
      _props.allow-when-locked = true;
      spawn = ["noctalia" "msg" "volume-mute"];
    };
    "XF86AudioMicMute" = {
      _props.allow-when-locked = true;
      spawn = ["noctalia" "msg" "mic-mute"];
    };
    "XF86MonBrightnessUp" = {
      _props.allow-when-locked = true;
      spawn = ["noctalia" "msg" "brightness-up"];
    };
    "XF86MonBrightnessDown" = {
      _props.allow-when-locked = true;
      spawn = ["noctalia" "msg" "brightness-down"];
    };
    "Mod+O" = {
      _props.repeat = false;
      toggle-overview = {};
    };
    "Mod+Q" = {
      _props.repeat = false;
      close-window = {};
    };
    "Mod+Left".focus-column-left = {};
    "Mod+Down".focus-window-down = {};
    "Mod+Up".focus-window-up = {};
    "Mod+Right".focus-column-right = {};
    "Mod+H".focus-column-left = {};
    "Mod+J".focus-workspace-down = {};
    "Mod+K".focus-workspace-up = {};
    "Mod+L".focus-column-right = {};
    "Mod+Ctrl+Left".move-column-left = {};
    "Mod+Ctrl+Down".move-window-down = {};
    "Mod+Ctrl+Up".move-window-up = {};
    "Mod+Ctrl+Right".move-column-right = {};
    "Mod+Ctrl+H".move-column-left = {};
    "Mod+Ctrl+U".move-window-down = {};
    "Mod+Ctrl+I".move-window-up = {};
    "Mod+Ctrl+L".move-column-right = {};
    "Mod+Home".focus-column-first = {};
    "Mod+End".focus-column-last = {};
    "Mod+Ctrl+Home".move-column-to-first = {};
    "Mod+Ctrl+End".move-column-to-last = {};
    "Mod+Shift+Left".focus-monitor-left = {};
    "Mod+Shift+Down".focus-monitor-down = {};
    "Mod+Shift+Up".focus-monitor-up = {};
    "Mod+Shift+Right".focus-monitor-right = {};
    "Mod+Shift+H".focus-monitor-left = {};
    "Mod+Shift+U".focus-monitor-down = {};
    "Mod+Shift+I".focus-monitor-up = {};
    "Mod+Shift+L".focus-monitor-right = {};
    "Mod+Shift+Ctrl+Left".move-column-to-monitor-left = {};
    "Mod+Shift+Ctrl+Down".move-column-to-monitor-down = {};
    "Mod+Shift+Ctrl+Up".move-column-to-monitor-up = {};
    "Mod+Shift+Ctrl+Right".move-column-to-monitor-right = {};
    "Mod+Shift+Ctrl+H".move-column-to-monitor-left = {};
    "Mod+Shift+Ctrl+J".move-column-to-monitor-down = {};
    "Mod+Shift+Ctrl+K".move-column-to-monitor-up = {};
    "Mod+Shift+Ctrl+L".move-column-to-monitor-right = {};
    "Mod+Page_Down".focus-workspace-down = {};
    "Mod+Page_Up".focus-workspace-up = {};
    "Mod+U".focus-window-down = {};
    "Mod+I".focus-window-up = {};
    "Mod+Ctrl+Page_Down".move-column-to-workspace-down = {};
    "Mod+Ctrl+Page_Up".move-column-to-workspace-up = {};
    "Mod+Ctrl+J".move-column-to-workspace-down = {};
    "Mod+Ctrl+K".move-column-to-workspace-up = {};
    "Mod+Shift+Page_Down".move-workspace-down = {};
    "Mod+Shift+Page_Up".move-workspace-up = {};
    "Mod+Shift+J".move-workspace-down = {};
    "Mod+Shift+K".move-workspace-up = {};

    "Mod+WheelScrollDown" = {
      _props.cooldown-ms = 150;
      focus-workspace-down = {};
    };
    "Mod+WheelScrollUp" = {
      _props.cooldown-ms = 150;
      focus-workspace-up = {};
    };
    "Mod+Ctrl+WheelScrollDown" = {
      _props.cooldown-ms = 150;
      move-column-to-workspace-down = {};
    };
    "Mod+Ctrl+WheelScrollUp" = {
      _props.cooldown-ms = 150;
      move-column-to-workspace-up = {};
    };
    "Mod+WheelScrollRight".focus-column-right = {};
    "Mod+WheelScrollLeft".focus-column-left = {};
    "Mod+Ctrl+WheelScrollRight".move-column-right = {};
    "Mod+Ctrl+WheelScrollLeft".move-column-left = {};
    "Mod+Shift+WheelScrollDown".focus-column-right = {};
    "Mod+Shift+WheelScrollUp".focus-column-left = {};
    "Mod+Ctrl+Shift+WheelScrollDown".move-column-right = {};
    "Mod+Ctrl+Shift+WheelScrollUp".move-column-left = {};

    "Mod+1".focus-workspace = 1;
    "Mod+2".focus-workspace = 2;
    "Mod+3".focus-workspace = 3;
    "Mod+4".focus-workspace = 4;
    "Mod+5".focus-workspace = 5;
    "Mod+6".focus-workspace = 6;
    "Mod+7".focus-workspace = 7;
    "Mod+8".focus-workspace = 8;
    "Mod+9".focus-workspace = 9;
    "Mod+Ctrl+1".move-column-to-workspace = 1;
    "Mod+Ctrl+2".move-column-to-workspace = 2;
    "Mod+Ctrl+3".move-column-to-workspace = 3;
    "Mod+Ctrl+4".move-column-to-workspace = 4;
    "Mod+Ctrl+5".move-column-to-workspace = 5;
    "Mod+Ctrl+6".move-column-to-workspace = 6;
    "Mod+Ctrl+7".move-column-to-workspace = 7;
    "Mod+Ctrl+8".move-column-to-workspace = 8;
    "Mod+Ctrl+9".move-column-to-workspace = 9;

    "Mod+BracketLeft".consume-window-into-column = {};
    "Mod+BracketRight".expel-window-from-column = {};
    "Mod+Comma".consume-or-expel-window-left = {};
    "Mod+Period".consume-or-expel-window-right = {};
    "Mod+R".switch-preset-column-width = {};
    "Mod+Shift+R".switch-preset-column-width-back = {};
    "Mod+Ctrl+R".switch-preset-window-height = {};
    "Mod+Ctrl+Shift+R".reset-window-height = {};
    "Mod+F".maximize-column = {};
    "Mod+Shift+F".fullscreen-window = {};
    "Mod+Ctrl+F".expand-column-to-available-width = {};
    "Mod+M".maximize-window-to-edges = {};
    "Mod+C".center-column = {};
    "Mod+Ctrl+C".center-visible-columns = {};
    "Mod+Minus".set-column-width = "-10%";
    "Mod+Equal".set-column-width = "+10%";
    "Mod+Shift+Minus".set-window-height = "-10%";
    "Mod+Shift+Equal".set-window-height = "+10%";
    "Mod+V".toggle-window-floating = {};
    "Mod+Shift+V".switch-focus-between-floating-and-tiling = {};
    "Mod+W".toggle-column-tabbed-display = {};

    "Print".spawn = ["noctalia" "msg" "screenshot-region"];
    "Ctrl+Print".spawn = ["noctalia" "msg" "screenshot-fullscreen"];
    "Alt+Print" = {
      screenshot-window = {
        _props.write-to-disk = true;
      };
    };
    "Mod+Escape" = {
      _props.allow-inhibiting = false;
      toggle-keyboard-shortcuts-inhibit = {};
    };
    "Mod+Shift+E".quit = {};
    "Ctrl+Alt+Delete".quit = {};
    "Mod+Shift+P".power-off-monitors = {};
  };
}
