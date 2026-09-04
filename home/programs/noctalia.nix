{
  programs.noctalia = {
    enable = true;
    settings = {
      bar = {
        main = {
          background_opacity = 0.85;
          capsule = true;
          capsule_fill = "surface";
          capsule_group = [
            {
              fill = "surface";
              id = "g2";
              members = [
                "cpu"
                "ram"
              ];
              opacity = 1;
              padding = 6;
            }
            {
              fill = "surface";
              id = "g1";
              members = [
                "clock"
                "date"
              ];
              opacity = 1;
              padding = 6;
            }
          ];
          center = [
            "privacy"
            "workspaces"
            "group:g2"
            "lock_keys"
          ];
          end = [
            "tray"
            "keyboard_layout"
            "clipboard"
            "volume"
            "brightness"
            "control-center"
          ];
          margin_edge = 0;
          margin_ends = 1;
          padding = 10;
          position = "left";
          radius = 15;
          radius_bottom_left = 0;
          radius_top_left = 0;
          shadow = false;
          start = [
            "group:g1"
            "active_window"
          ];
          thickness = 35;
          widget_spacing = 12;
        };
        order = ["main"];
      };
      desktop_widgets.enabled = false;
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
        pre_action_fade_seconds = 5;
      };
      keybinds = {
        cancel = ["Escape"];
        validate = ["Return"];
      };
      lockscreen_widgets = {
        enabled = true;
        schema_version = 2;
        widget_order = [
          "lockscreen-widget-0000000000000001"
          "lockscreen-login-box@eDP-1"
        ];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        widget = {
          "lockscreen-login-box@eDP-1" = {
            box_height = 0;
            box_width = 0;
            cx = 800;
            cy = 786;
            output = "eDP-1";
            rotation = 0;
            type = "login_box";
          };
          lockscreen-widget-0000000000000001 = {
            box_height = 256;
            box_width = 432;
            cx = 800;
            cy = 386;
            output = "eDP-1";
            rotation = 0;
            settings = {
              background = true;
              clock_style = "digital";
            };
            type = "clock";
          };
        };
      };
      notification = {
        layer = "overlay";
        position = "bottom_left";
      };
      osd = {
        kinds = {
          keyboard_layout = false;
          media = false;
        };
        orientation = "vertical";
        position = "bottom_left";
        position_vertical = "bottom_left";
      };
      plugins.enabled = ["noctalia/translator" "yuuto/calculator"];
      plugin_settings = {
        "noctalia/translator".target_lang = "ru";
      };
      shell = {
        animation.speed = 0.5;
        app_icon_color = "on_surface";
        app_icon_colorize = true;
        font_family = "FiraCode Nerd Font Mono";
        panel = {
          clipboard_placement = "attached";
          launcher_placement = "attached";
          polkit_placement = "attached";
          shadow = false;
          transparency_mode = "glass";
        };
        polkit_agent = true;
        screenshot = {
          confirm_region = true;
          directory = "/home/inari/Pictures/Screenshots";
          pipe_command = "satty -f -";
          pipe_to_command = true;
          save_to_file = false;
        };
        keyboard_layout = {
          custom_labels = {
            "English (US)" = "US";
            "Russian (phonetic, YAZHERTY)" = "RU";
          };
          show_glyph = false;
        };
        settings_show_advanced = true;
      };
      control_center = {
        shortcuts = [
          {type = "wifi";}
          {type = "bluetooth";}
          {type = "caffeine";}
          {type = "nightlight";}
          {type = "dark_mode";}
          {type = "notification";}
        ];
        show_shortcut_labels = false;
      };
      theme = {
        builtin = "Catppuccin";
        templates = {
          builtin_ids = [
            "gtk3"
            "gtk4"
            "ghostty"
            "qt"
          ];
          community_ids = [
            "discord"
            "gimp"
            "heroiclauncher"
            "papirus-icons"
            "prismlauncher"
            "steam"
            "zen-browser"
            "zathura"
          ];
        };
      };
      wallpaper = {
        automation = {
          enabled = true;
          interval_seconds = 86400;
        };
        directory = "/home/inari/Pictures/Wallpapers/";
      };
      weather.enabled = false;
      widget = {
        brightness.show_label = false;
        clock.format = "{:%0I:%M}";
        control-center = {
          custom_image = "/home/inari/Pictures/logo.png";
          custom_image_colorize = true;
        };
        cpu.show_value = false;
        lock_keys.hide_when_off = true;
        privacy = {hide_inactive = true;};
        ram = {
          show_value = false;
          stat = "ram_pct";
        };
        tray.drawer = true;
        volume.show_label = false;
        workspaces = {
          empty_color = "tertiary";
          show_labels = false;
        };
      };
    };
  };
}
