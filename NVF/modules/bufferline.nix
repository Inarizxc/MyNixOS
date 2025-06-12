{
  pkgs,
  lib,
  ...
}: {
  vim.tabline.nvimBufferline = {
    enable = true;
    mappings = {
      closeCurrent = "<leader>x";
      cycleNext = "<Tab>";
      cyclePrevious = "<S-Tab>";
    };
    setupOpts.options = {
      buffer_close_icon = "";
      close_icon = "";
      modified_icon = "●";
      diagnostics = false;
      numbers = "none";
      sort_by = "insert_at_end";
      indicator.style = "none";
      always_show_bufferline = false;
    };
  };
}
