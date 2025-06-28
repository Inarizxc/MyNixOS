{ ... }:
{
  programs.helix = {
      enable = true;
      settings = {
        theme = "catppuccin-mocha";
        editor = {
          default-yank-register = "+";
          shell = [
            "fish"
            "-c"
          ];
          gutters = [
            "diagnostics"
            "line-numbers"
            "spacer"
            "diff"
          ];
          bufferline = "multiple";
          completion-replace = true;
          color-modes = true;
          popup-border = "all";
          end-of-line-diagnostics = "info";
          continue-comments = false;

          indent-guides.render = true;
          inline-diagnostics.cursor-line = "warning";

          statusline = {
            left = [
              "mode"
              "spinner"
              "version-control"
            ];
            center = [
              "diagnostics"
              "file-name"
              "read-only-indicator"
              "file-modification-indicator"
            ];
            right = [
              "register"
              "file-type"
              "selections"
              "position-percentage"
              "file-encoding"
            ];
            mode.normal = "N";
            mode.insert = "I";
            mode.select = "S";
          };

        };
        keys.normal = {
          tab = "goto_next_buffer";
          S-tab = "goto_previous_buffer";

        };
      };
    };
}
