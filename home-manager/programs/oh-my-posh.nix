{
  programs.oh-my-posh = {
    enable = true;
    settings = {
      version = 4;
      final_space = true;

      palette = {
        pink = "#F5C2E7";
        lavender = "#B4BEFE";
        blue = "#89B4FA";
        wight = "#FFFFFF";
        text = "#45475A";
        mauve = "#CBA6F7";
        red = "#F38BA8";
        green = "#A6E3A1";
        maroon = "#EBA0AC";
        sky = "#89DCEB";
        yellow = "#F9E2AF";
      };

      blocks = [
        {
          alignment = "left";
          type = "prompt";
          segments = [
            {
              type = "nix-shell";
              style = "diamond";
              powerline_symbol = "";
              leading_diamond = "";
              background = "p:mauve";
              foreground = "p:text";
              template = "{{ if eq .Env.IN_NIX_SHELL \"impure\" }} {{else}}{{end}}";
            }
            {
              type = "os";
              style = "diamond";
              powerline_symbol = "";
              leading_diamond = "";
              background = "p:mauve";
              foreground = "p:text";
              template = "{{.Icon}} ";
            }
            {
              type = "path";
              style = "powerline";
              powerline_symbol = "";
              background = "p:pink";
              foreground = "p:text";
              options = {
                home_icon = "~";
                style = "mixed";
                mixed_threshold = 15;
                mapped_locations = {
                  "~/Documents" = "~/󰈙";
                  "~/Downloads" = "~/󰇚";
                  "~/Music" = "~/";
                  "~/NixOS" = "~/";
                  "~/Pictures" = "~/";
                  "~/Projects" = "~/󱁤";
                  "~/Videos" = "~/";
                  "~/Virtualization" = "~/";

                  "~/Projects/rust" = "~/󱁤/";
                  "~/Projects/go" = "~/󱁤/󰟓";
                  "~/Projects/zig" = "~/󱁤/";
                  "~/Projects/nix" = "~/󱁤/";
                  "~/Projects/python" = "~/󱁤/";
                };
              };
              template = " {{ .Path }}";
            }
            {
              type = "jujutsu";
              style = "powerline";
              powerline_symbol = "";
              background = "p:lavender";
              foreground = "p:text";
              options = {
                ignore_working_copy = true;
                change_id_min_len = 8;
                fetch_ahead_counter = false;
                ahead_icon = "⇡";
                status_formats = {
                  Added = "+%d";
                  Deleted = "-%d";
                  Modified = "~%d";
                  Moved = ">%d";
                };
              };
              template = "  {{.ChangeID}}{{if .Working.Changed}} {{ .Working.String }}  {{ end }}";
            }
            {
              type = "git";
              style = "powerline";
              powerline_symbol = "";
              background = "p:lavender";
              foreground = "p:text";
              options = {
                branch_icon = "";
                cherry_pick_icon = "";
                commit_icon = "";
                fetch_status = false;
                fetch_upstream_icon = false;
                merge_icon = "";
                no_commits_icon = "";
                rebase_icon = "";
                revert_icon = "";
                tag_icon = "";
              };
              template = "{{ if not .Segments.Jujutsu }} {{ .HEAD }}{{else}}{{end}}";
            }
            {
              type = "rust";
              style = "powerline";
              powerline_symbol = "";
              background = "p:maroon";
              foreground = "p:text";
              template = "  {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}";
            }
            {
              type = "golang";
              style = "powerline";
              powerline_symbol = "";
              background = "p:sky";
              foreground = "p:text";
              template = " 󰟓 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}";
            }
            {
              type = "zig";
              style = "powerline";
              powerline_symbol = "";
              background = "p:yellow";
              foreground = "p:text";
              template = "  {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}";
            }
            {
              type = "python";
              style = "powerline";
              powerline_symbol = "";
              background = "p:blue";
              foreground = "p:text";
              template = "  {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}";
            }
          ];
        }
      ];
    };
    enableNushellIntegration = true;
  };
}
