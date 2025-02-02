{...}: {
  vim.git = {
    enable = true;
    gitsigns = {
      enable = true;
      mappings = {
        blameLine = null;
        diffProject = "<leader>gd";
      };
    };
  };
}
