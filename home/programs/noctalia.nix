{...}: {
  programs.noctalia = {
    enable = true;
    settings = {
      bar = {
        default = {
          background_opacity = 0.85;
          capsule = true;
          capsule_fill = "surface";
          center = [
            "workspaces"
            "cpu"
            "ram"
          ];
          end = [
            "keyboard_layout"
            "tray"
            "clipboard"
            "volume"
            "brightness"
            "battery"
            "control-center"
          ];
          margin_edge = 2;
          margin_ends = 2;
          padding = 10;
          position = "left";
          radius = 15;
          shadow = false;
          start = [
            "clock"
            "date"
            "active_window"
          ];
          thickness = 35;
          widget_spacing = 12;
        };
        order = ["default"];
      };
      desktop_widgets = {enabled = false;};
      dock = {
        background_opacity = 0.85;
        shadow = false;
      };
      idle = {
        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 1800;
          };
          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 3600;
          };
          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 2700;
          };
        };
        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];
        pre_action_fade_seconds = 0;
      };
      keybinds = {
        cancel = ["Escape"];
        validate = ["Return"];
      };
      lockscreen_widgets = {
        enabled = false;
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        schema_version = 2;
        widget = {
          "lockscreen-login-box@eDP-1" = {
            box_height = 0;
            box_width = 0;
            cx = 800;
            cy = 777;
            output = "eDP-1";
            rotation = 0;
            type = "login_box";
          };
        };
        widget_order = ["lockscreen-login-box@eDP-1"];
      };
      notification = {position = "bottom_left";};
      osd = {
        kinds = {keyboard_layout = false;};
        orientation = "vertical";
        position = "bottom_left";
      };
      shell = {
        app_icon_color = "on_surface";
        app_icon_colorize = true;
        font_family = "FiraCode Nerd Font Mono";
        panel = {
          clipboard_placement = "attached";
          launcher_placement = "attached";
          session_placement = "centered";
          shadow = false;
          transparency_mode = "glass";
        };
        screenshot = {
          directory = "/home/inari/Pictures/Screenshots";
          pipe_command = "satty -f -";
          pipe_to_command = true;
        };
        settings_show_advanced = true;
      };
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
        templates = {
          builtin_ids = ["gtk3"];
          community_ids = [
            "zen-browser"
            "papirus-icons"
          ];
        };
      };
      wallpaper = {
        enable = true;
        directory = "/home/inari/Pictures/Wallpapers/";
        automation = {
          enabled = true;
          interval_seconds = 86400;
        };
      };
      weather = {enabled = false;};
      widget = {
        brightness = {show_label = false;};
        control-center = {
          custom_image = "/home/inari/Pictures/logo.png";
          custom_image_colorize = true;
        };
        cpu = {show_label = false;};
        keyboard_layout = {
          custom_labels = {
            "English (US)" = "US";
            "Russian (phonetic, YAZHERTY)" = "RU";
          };
          show_icon = false;
        };
        ram = {show_label = false;};
        volume = {show_label = false;};
        workspaces = {
          display = "none";
          empty_color = "tertiary";
        };
      };
    };
  };
}
