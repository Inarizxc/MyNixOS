{
  pkgs,
  lib,
  ...
}: {
  vim.keymaps = [
    {
      key = "\\";
      mode = "n";
      silent = true;
      action = ":Neotree toggle position=left<CR>";
    }
    {
      key = "x";
      mode = "n";
      silent = true;
      action = "\"_x";
    }
    {
      key = "<";
      mode = "v";
      silent = true;
      action = "<gv";
    }
    {
      key = ">";
      mode = "v";
      silent = true;
      action = ">gv";
    }
    {
      key = "<C-h>";
      mode = "n";
      silent = true;
      action = ":wincmd h<CR>";
    }
    {
      key = "<C-j>";
      mode = "n";
      silent = true;
      action = ":wincmd j<CR>";
    }
    {
      key = "<C-k>";
      mode = "n";
      silent = true;
      action = ":wincmd k<CR>";
    }
    {
      key = "<C-l>";
      mode = "n";
      silent = true;
      action = ":wincmd l<CR>";
    }
    {
      key = "<Up>";
      mode = "n";
      silent = true;
      action = ":resize +2<CR>";
    }
    {
      key = "<Down>";
      mode = "n";
      silent = true;
      action = ":resize -2<CR>";
    }
    {
      key = "<Left>";
      mode = "n";
      silent = true;
      action = ":vertical resize -2<CR>";
    }
    {
      key = "<Right>";
      mode = "n";
      silent = true;
      action = ":vertical resize +2<CR>";
    }
    ];
}
