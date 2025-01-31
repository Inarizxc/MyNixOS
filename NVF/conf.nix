{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./keymaps.nix
    ./plugins/lualine.nix
    ./plugins/bufferline.nix
  ];
  vim = {
    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
    };

    options = {
      shiftwidth = 2;
      tabstop = 2;

      wrap = false;
    };
    useSystemClipboard = true;

    languages = {
      enableFormat = true;
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
      zig.enable = true;
      python.enable = true;
      markdown = {
        enable = true;
        extensions.render-markdown-nvim.enable = true;
      };
    };

    filetree.neo-tree = {
      enable = true;
      setupOpts = {
        enable_cursor_hijack = true;
      };
    };
    mini = {
      animate.enable = true;
      ai.enable = true;
      icons.enable = true;
      surround.enable = true;
      pairs.enable = true;
      bracketed.enable = true;
      splitjoin.enable = true;
      move.enable = true;
      indentscope = {
        enable = true;
        setupOpts = {
          symbol = "▏";
        };
      };
    };
    autocomplete.nvim-cmp.enable = true;
    ui.noice.enable = true;
    binds.whichKey.enable = true;
    git.vim-fugitive.enable = true;
    ui.colorizer.enable = true;
    visuals.fidget-nvim.enable = true;
    lsp.null-ls.enable = true;

    ui.borders.enable = true;
    ui.borders.plugins = {
      nvim-cmp.enable = true;
      which-key.enable = true;
    };
  };
}
