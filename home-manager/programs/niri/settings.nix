{
  wayland.windowManager.niri = {
    enable = true;
    settings = {
      prefer-no-csd = true;
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      input = {
        keyboard = {
          repeat-rate = 30;
          repeat-delay = 200;
          xkb = {
            layout = "us,ru";
            variant = ",phonetic_YAZHERTY";
            options = "grp:win_space_toggle";
          };
          track-layout = "window";
        };
        touchpad = {
          tap = {};
          natural-scroll = {};
        };
        focus-follows-mouse = {};
      };

      gestures.hot-corners.off = {};

      overview = {
        zoom = 0.70;
        backdrop-color = "#11111b";
      };

      layout = {
        gaps = 5;
        center-focused-column = "never";
        preset-column-widths._children = let
          g = 1.618033988;
        in [
          {proportion = 1 / g / g;}
          {proportion = 0.5;}
          {proportion = 1 / g;}
        ];
        focus-ring = {
          width = 2;
          active-color = "#CBA6F7";
          inactive-color = "#313244";
        };
        tab-indicator = {
          hide-when-single-tab = {};
          place-within-column = {};
        };
      };

      cursor = {
        xcursor-theme = "catppuccin-mocha-dark-cursors";
        xcursor-size = 20;
        hide-after-inactive-ms = 5000;
      };

      hotkey-overlay = {
        skip-at-startup = {};
        hide-not-bound = {};
      };

      animations = {
        window-open = {
          duration-ms = 450;
          curve = "ease-out-expo";
        };
        window-close = {
          duration-ms = 200;
          curve = "ease-out-quad";
        };
        screenshot-ui-open = {
          duration-ms = 1000;
          curve = "ease-out-expo";
        };
        workspace-switch = {
          spring._props = {
            damping-ratio = 0.85;
            stiffness = 250;
            epsilon = 0.0001;
          };
        };
        horizontal-view-movement = {
          spring._props = {
            damping-ratio = 0.9;
            stiffness = 250;
            epsilon = 0.0001;
          };
        };
        window-movement = {
          spring._props = {
            damping-ratio = 0.85;
            stiffness = 250;
            epsilon = 0.0001;
          };
        };
        window-resize = {
          spring._props = {
            damping-ratio = 0.9;
            stiffness = 250;
            epsilon = 0.0001;
          };
        };
        overview-open-close = {
          spring._props = {
            damping-ratio = 0.85;
            stiffness = 250;
            epsilon = 0.0001;
          };
        };
      };

      debug.honor-xdg-activation-with-invalid-serial = true;

      _children = [
        {spawn-at-startup._args = ["noctalia"];}
        {spawn-at-startup._args = ["zen-beta"];}

        {
          output = {
            _args = ["eDP-1"];
            mode = "1920x1080@60.008";
            scale = 1.2;
          };
        }

        {
          layer-rule._children = [
            {match._props = {namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd)$";};}
            {background-effect = {xray = false;};}
          ];
        }

        {
          layer-rule._children = [
            {match._props = {namespace = "wlr_which_key";};}
            {
              background-effect = {
                blur = true;
                xray = false;
              };
            }
          ];
        }

        {
          window-rule._children = [
            {
              background-effect = {
                blur = true;
                xray = false;
              };
            }
          ];
        }

        {
          window-rule._children = [
            {match._props = {app-id = "zen-beta";};}
            {open-maximized-to-edges = true;}
          ];
        }

        {
          window-rule._children = [
            {
              geometry-corner-radius._args = [20.0 20.0 20.0 20.0];
              clip-to-geometry = true;
            }
          ];
        }
        {
          window-rule._children = [
            {match._props = {is-floating = false;};}
            {open-maximized = true;}
          ];
        }
        {
          window-rule._children = [
            {
              match._props = {
                app-id = "zen-beta";
                title = "Картинка в картинке";
              };
            }
            {
              match._props = {
                app-id = "zen";
                title = "Картинка в картинке";
              };
            }
            {open-floating = true;}
            {
              default-floating-position._props = {
                x = 16;
                y = 16;
                relative-to = "top-left";
              };
            }
          ];
        }
        {
          window-rule._children = [
            {match._props = {app-id = "^org\\.keepassxc\\.KeePassXC$";};}
            {match._props = {app-id = "^org\\.gnome\\.World\\.Secrets$";};}
            {block-out-from = "screen-capture";}
          ];
        }
        {
          window-rule._children = [
            {match._props = {is-window-cast-target = true;};}
            {
              focus-ring = {
                width = 2;
                active-color = "#F38BA8";
                inactive-color = "#313244";
              };
            }
          ];
        }
        {
          window-rule._children = [
            {
              match._props = {
                app-id = "^io.github.elyprismlauncher.ElyPrismLauncher$";
                is-floating = true;
              };
            }
            {default-column-width.fixed = 1250;}
            {default-window-height.fixed = 830;}
          ];
        }
        {
          window-rule._children = [
            {match._props = {app-id = "com.gabm.satty";};}
            {open-floating = true;}
          ];
        }
        {
          window-rule._children = [
            {
              match._props = {
                app-id = "dev.noctalia.Noctalia";
                title = "Настройки Noctalia";
              };
            }
            {open-floating = true;}
            {default-column-width.fixed = 1050;}
            {default-window-height.fixed = 800;}
          ];
        }
      ];
    };
  };
}
