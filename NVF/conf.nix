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
    ./plugins/neo-tree.nix
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

      nix = {
        enable = true;
        lsp.server = "nixd";
      };
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
      otter-nvim.enable = true;

      null-ls.enable = true;
    };
    snippets.luasnip.enable = true;

    mini = {
      animate.enable = true;
      ai.enable = true;
      bracketed.enable = true;
      splitjoin.enable = true;
      move.enable = true;
      hipatterns.enable = true;
    };
    autocomplete.blink-cmp.enable = true;
    ui.noice.enable = true;
    binds.whichKey.enable = true;
    ui.colorizer.enable = true;
    telescope.enable = true;
    notes.todo-comments.enable = true;
    comments.comment-nvim.enable = true;
    autopairs.nvim-autopairs.enable = true;
    utility.surround.enable = true;

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
