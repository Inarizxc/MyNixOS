{ ... }:
{
  programs.niri = {
    enable = true;
    settings = {
      prefer-no-csd = true;
      spawn-at-startup = [
        { command = [ "noctalia-shell" ]; }
        { command = [ "zen-beta" ]; }
      ];
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
          enable = true;
          tap = true;
          natural-scroll = true;
        };
        focus-follows-mouse = {
          enable = true;
          max-scroll-amount = "0%";
        };
      };
      gestures = {
        hot-corners.enable = false;
      };
      overview = {
        zoom = 0.70;
        backdrop-color = "#11111b";
      };
      outputs."eDP-1" = {
        mode = {
          height = 1080;
          width = 1920;
          refresh = 120.030;
        };
        scale = 1.25;
      };
      layout = {
        gaps = 5;
        center-focused-column = "never";
        preset-column-widths =
          let
            g = 1.618033988;
          in
          [
            { proportion = 1 / g / g; }
            { proportion = 0.5; }
            { proportion = 1 / g; }
          ];
        focus-ring = {
          enable = true;
          width = 2;
          active.color = "#CBA6F7";
          inactive.color = "#313244";
        };
        tab-indicator = {
          enable = true;
          hide-when-single-tab = true;
          place-within-column = true;
        };
      };
      cursor = {
        theme = "catppuccin-mocha-dark-cursors";
        size = 20;

        hide-after-inactive-ms = 30000;
      };
      hotkey-overlay = {
        skip-at-startup = true;
        hide-not-bound = true;
      };
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
      animations = {
        window-open = {
          kind.easing = {
            curve = "ease-out-expo";
            duration-ms = 450;
          };
        };
        window-close = {
          kind.easing = {
            curve = "ease-out-quad";
            duration-ms = 200;
          };
        };
        screenshot-ui-open = {
          kind.easing = {
            curve = "ease-out-expo";
            duration-ms = 1000;
          };
        };
        workspace-switch = {
          kind.spring = {
            damping-ratio = 0.85;
            stiffness = 250;
            epsilon = 0.0001;
          };
        };
        horizontal-view-movement = {
          kind.spring = {
            damping-ratio = 0.9;
            stiffness = 250;
            epsilon = 0.0001;
          };
        };
        window-movement = {
          kind.spring = {
            damping-ratio = 0.85;
            stiffness = 250;
            epsilon = 0.0001;
          };
        };
        window-resize = {
          kind.spring = {
            damping-ratio = 0.9;
            stiffness = 250;
            epsilon = 0.0001;
          };
        };
        overview-open-close = {
          kind.spring = {
            damping-ratio = 0.85;
            stiffness = 250;
            epsilon = 0.0001;
          };
        };
      };
      window-rules = [
        {
          open-maximized = true;
          geometry-corner-radius =
            let
              round = 15.0;
            in
            {
              bottom-left = round;
              bottom-right = round;
              top-left = round;
              top-right = round;
            };
          clip-to-geometry = true;
        }

        {
          matches = [
            {
              app-id = "zen-beta";
              title = "^Картинка в картинке";
            }
            {
              app-id = "zen";
              title = "^Картинка в картинке";
            }
          ];
          open-floating = true;
          default-floating-position = {
            x = 16;
            y = 16;
            relative-to = "top-left";
          };
        }
        {
          matches = [
            { app-id = "^org\\.keepassxc\\.KeePassXC$"; }
            { app-id = "^org\\.gnome\\.World\\.Secrets$"; }
          ];
          block-out-from = "screen-capture";
        }
        {
          matches = [ { is-window-cast-target = true; } ];
          focus-ring = {
            enable = true;
            width = 2;
            active.color = "#F38BA8";
            inactive.color = "#313244";
          };
        }
        {
          matches = [ { app-id = "numr"; } ];
          open-floating = true;
        }
      ];
    };
  };
}
