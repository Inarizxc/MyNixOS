{ ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty";
        source = "./logo.png";
        width = 23;
        height = 9;
      };
      display = {
        separator = " │ ";
        color = {
          keys = "#cba6f7";
        };
      };
      modules = [
        {
          type = "custom";
          format = "╭────╮";
        }
        {
          type = "title";
          key = "│  ";
          format = "{user-name}";
        }
        {
          type = "os";
          key = "│ 󰯵 ";
          format = "{name}";
        }
        {
          type = "kernel";
          key = "│ 󰰊 ";
        }
        {
          type = "uptime";
          key = "│ 󰥔 ";
        }
        {
          type = "shell";
          key = "│ 󰰢 ";
        }
        {
          type = "terminal";
          key = "│ 󰰥 ";
        }
        {
          type = "cpu";
          key = "│ 󰯲 ";
        }
        {
          type = "custom";
          format = "╰────╯";
        }
      ];
    };
  };

}
