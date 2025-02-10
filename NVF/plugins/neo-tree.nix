{...}: {
  vim.filetree.neo-tree = {
    enable = true;
    setupOpts = {
      enable_diagnostics = false;
      enable_cursor_hijack = true;
      default_component_configs = {
        git_status = {
          symbols = {
            added = "";
            modified = "";
            deleted = "✖";
            renamed = "󰁕";
            untracked = "";
            ignored = "";
            unstaged = "󰄱";
            staged = "";
            conflict = "";
          };
        };
      };
    };
  };
}
