{
  programs.noctalia = {
    enable = true;
    settings = {
      audio.enable_sounds = true;
      bar = {
        main = {
          background_opacity = 0.85;
          capsule = false;
          margin_edge = 0;
          margin_ends = 10;
          padding = 10;
          position = "left";
          radius = 80;
          radius_bottom_left = 0;
          radius_top_left = 0;
          shadow = false;
          thickness = 35;
          widget_spacing = 20;
          capsule_group = [
            {
              fill = "surface";
              id = "g2";
              members = [
                "cpu"
                "ram"
              ];
              opacity = 0;
              padding = 6;
            }
            {
              fill = "surface";
              id = "g1";
              members = [
                "clock"
                "date"
              ];
              opacity = 0;
              padding = 6;
            }
          ];
          start = [
            "group:g1"
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
        };
        order = ["main"];
      };
      desktop_widgets.enabled = false;
      control_center = {
        calendar.show_events_card = false;
        hidden_tabs = [
          "weather"
          "screen-time"
        ];
        shortcuts = [
          {type = "wifi";}
          {type = "bluetooth";}
          {type = "caffeine";}
          {type = "notification";}
        ];
        show_shortcut_labels = false;
        sidebar_section = "none";
        width = 750;
      };
      dock.shadow = false;
      idle = {
        pre_action_fade_seconds = 5;
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
      };
      keybinds = {
        cancel = ["Escape"];
        validate = ["Return"];
      };
      lockscreen_widgets = {
        enabled = true;
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        schema_version = 2;
        widget = {
          "lockscreen-login-box@eDP-1" = {
            box_height = 196;
            box_width = 810;
            cx = 800;
            cy = 786;
            output = "eDP-1";
            placement_height = 900;
            placement_width = 1600;
            rotation = 0;
            settings = {
              center_password_text = false;
              layout = "regular";
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_media = true;
              show_session_buttons = true;
              show_unlock_hint = true;
              show_weather = true;
            };
            type = "login_box";
          };
          lockscreen-widget-0000000000000001 = {
            box_height = 256;
            box_width = 432;
            cx = 800;
            cy = 386;
            output = "eDP-1";
            placement_height = 900;
            placement_width = 1600;
            rotation = 0;
            settings = {
              background = true;
              clock_style = "digital";
            };
            type = "clock";
          };
        };
        widget_order = [
          "lockscreen-widget-0000000000000001"
          "lockscreen-login-box@eDP-1"
        ];
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
      plugin_settings = {
        "noctalia/translator".target_lang = "ru";
        "yuuto/calculator" = {
          panel_layer = "overlay";
          panel_open_near_click = false;
          panel_placement = "floating";
        };
      };
      plugins.enabled = [
        "noctalia/translator"
        "yuuto/calculator"
        "aristides/udiskie"
      ];

      shell = {
        animation.speed = 0.5;
        app_icon_colorize = true;
        app_icon_color = "on_surface";
        corner_radius_scale = 2;
        font_family = "Maple Mono NF";
        greeter_sync.auto_sync = false;
        keyboard_layout = {
          custom_labels = {
            "English (US)" = "US";
            "Russian (phonetic, YAZHERTY)" = "RU";
          };
        };
        panel = {
          clipboard_placement = "floating";
          clipboard_position = "auto";
          control_center_placement = "floating";
          launcher_placement = "floating";
          launcher_position = "auto";
          polkit_placement = "floating";
          polkit_position = "auto";
          session_placement = "floating";
          wallpaper_placement = "floating";
        };
        panel_anchor_bar = "main";
        polkit_agent = true;
        screenshot = {
          annotate = true;
          confirm_region = true;
          directory = "/home/inari/Pictures/Screenshots";
          pipe_to_command = false;
          save_to_file = false;
        };
        session = {
          actions = [
            {
              action = "lock";
              countdown_seconds = 0;
              enabled = true;
              shortcut = "1";
              variant = "default";
            }
            {
              action = "logout";
              countdown_seconds = 0;
              enabled = true;
              shortcut = "2";
              variant = "default";
            }
            {
              action = "lock_and_suspend";
              countdown_seconds = 0;
              enabled = true;
              shortcut = "3";
              variant = "default";
            }
            {
              action = "reboot";
              countdown_seconds = 5;
              enabled = true;
              shortcut = "4";
              variant = "default";
            }
            {
              action = "shutdown";
              countdown_seconds = 5;
              enabled = true;
              shortcut = "5";
              variant = "destructive";
            }
          ];
          grid = true;
          grid_columns = 1;
          show_shortcuts = false;
        };
        settings_show_advanced = true;
      };
      theme = {
        builtin = "Catppuccin";
        source = "builtin";
        templates = {
          builtin_ids = [
            "gtk3"
            "gtk4"
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
        keyboard_layout.show_glyph = false;
        lock_keys.hide_when_off = true;
        privacy.hide_inactive = true;
        ram = {
          show_value = false;
          stat = "ram_pct";
        };
        tray = {
          detached_panel = true;
          drawer = true;
        };
        volume.show_label = false;
        workspaces = {
          empty_color = "tertiary";
          show_labels = false;
          show_tooltip = false;
        };
      };
    };
  };
}
