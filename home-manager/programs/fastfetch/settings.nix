{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty";
        source = "./logo.png";
        width = 21;
        height = 9;
        padding.right = 1;
      };
      display = {
        separator = " │ ";
        color = {
          keys = "#cba6f7";
        };
      };
      modules = [
        {
          format = "╭───╮";
          type = "custom";
        }
        {
          format = "{user-name}";
          key = "│ ";
          type = "title";
        }
        {
          format = "{name}";
          key = "│ 󰯵";
          type = "os";
        }
        {
          key = "│ 󰰊";
          type = "kernel";
        }
        {
          key = "│ 󰥔";
          type = "uptime";
        }
        {
          key = "│ 󰰢";
          type = "shell";
        }
        {
          key = "│ 󰰥";
          type = "terminal";
        }
        {
          key = "│ 󰯲";
          type = "cpu";
        }
        {
          format = "╰───╯";
          type = "custom";
        }
      ];
    };
  };
}
