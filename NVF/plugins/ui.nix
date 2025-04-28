{...}: {
  vim = {
    ui = {
      noice.enable = true;
      colorizer.enable = true;
      borders.enable = true;
    };

    binds.whichKey.enable = true;
    telescope.enable = true;
    notes.todo-comments.enable = true;
    comments.comment-nvim.enable = true;

    utility.multicursors.enable = true;

    dashboard = {
      alpha.enable = true;
      alpha.theme = "startify";
    };

    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        notifier = {enable = true;};
      };
    };

    visuals = {
      indent-blankline = {
        enable = true;
        setupOpts.indent.char = "▏";
      };
      highlight-undo.enable = true;
    };
  };
}
