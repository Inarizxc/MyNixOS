{...}: {
  vim.mini = {
    animate.enable = true;
    ai.enable = true;
    bracketed.enable = true;
    splitjoin.enable = true;
    move.enable = true;
    hipatterns.enable = true;
    surround.enable = true;
    pairs.enable = true;
    operators.enable = true;
    files = {
      enable = true;
      setupOpts = {
        mappings = {
          close = "\\";
        };
      };
    };
  };
}
