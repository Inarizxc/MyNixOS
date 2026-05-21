{ ... }:
{
  programs.oh-my-posh = {
    enable = true;
    settings = {
      version = 4;
      final_space = true;

      palette = {
        os = "#ACB0BE";
        pink = "#F5C2E7";
        lavender = "#B4BEFE";
        blue = "#89B4FA";
        wight = "#FFFFFF";
        text = "#45475a";
        mauve = "#cba6f7";
        red = "#f38ba8";
        green = "#a6e3a1";
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
              foreground = "p:wight";
              template = "{{ if eq .Env.IN_NIX_SHELL \"impure\" }}nix-shell{{else}}{{end}}";
            }
            {
              type = "os";
              style = "diamond";
              powerline_symbol = "";
              leading_diamond = "";
              background = "p:mauve";
              foreground = "p:wight";
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
              };
              template = " {{ .Path }}";
            }
            {
              type = "git";
              style = "powerline";
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
              powerline_symbol = "";
              template = " {{ .HEAD }}";
            }
          ];
        }
      ];
    };
    enableNushellIntegration = true;
  };
}
