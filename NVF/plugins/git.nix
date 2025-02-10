{...}: {
  vim.git = {
    enable = true;
    gitsigns = {
      enable = true;
      setupOpts = {
        signs = {
          add = {text = "+";};
          change = {text = "~";};
          delete = {text = "_";};
          topdelete = {text = "‾";};
          changedelete = {text = "~";};
        };
        signs_staged = {
          add = {text = "+";};
          change = {text = "~";};
          delete = {text = "_";};
          topdelete = {text = "‾";};
          changedelete = {text = "~";};
        };
      };
      mappings = {
        blameLine = null;
        diffProject = null;
        diffThis = null;
        nextHunk = null;
        previewHunk = null;
        previousHunk = null;
        resetBuffer = null;
        resetHunk = null;
        stageBuffer = null;
        stageHunk = null;
        toggleBlame = null;
        toggleDeleted = null;
        undoStageHunk = null;
      };
    };
  };
}
