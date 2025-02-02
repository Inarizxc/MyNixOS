{
  pkgs,
  lib,
  ...
}
: {
  imports = [
    ./keymaps.nix
    ./plugins/lualine.nix
    ./plugins/bufferline.nix
    ./plugins/git.nix
  ];
  vim = {
    package = pkgs.neovim-unwrapped;
    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
    };
    options = {
      shiftwidth = 2;
      tabstop = 2;

      cmdheight = 0;

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

      ts.enable = true;
      svelte.enable = true;
      tailwind.enable = true;
      css.enable = true;
      html.enable = true;

      markdown = {
        enable = true;
        extensions.render-markdown-nvim.enable = true;
      };
    };

    lsp = {
      enable = true;
      formatOnSave = true;

      lsplines.enable = true;
    };
    snippets.luasnip.enable = true;

    filetree.neo-tree = {
      enable = true;
      setupOpts = {
        enable_diagnostics = false;
        enable_cursor_hijack = true;
      };
    };

    mini = {
      animate.enable = true;
      ai.enable = true;
      surround.enable = true;
      pairs.enable = true;
      bracketed.enable = true;
      splitjoin.enable = true;
      move.enable = true;
      hipatterns.enable = true;
    };
    autocomplete.nvim-cmp.enable = true;
    ui.noice.enable = true;
    binds.whichKey.enable = true;
    ui.colorizer.enable = true;
    telescope.enable = true;

    visuals.indent-blankline = {
      enable = true;
      setupOpts.indent.char = "▏";
    };

    ui.borders.enable = true;

    undoFile.enable = true;
    visuals.highlight-undo.enable = true;

    spellcheck.languages = ["en" "ru"];
  };
}
