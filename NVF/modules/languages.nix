{...}: {
  vim.languages = {
    enableFormat = true;
    enableTreesitter = true;

    nix = {
      enable = true;
      lsp.server = "nixd";
    };
    zig.enable = true;
    python.enable = true;
    rust.enable = true;

    ts.enable = true;
    svelte.enable = true;
    tailwind.enable = true;
    css.enable = true;
    html.enable = true;
    bash.enable = true;

    markdown = {
      enable = true;
      extensions.render-markdown-nvim = {
        enable = true;
        setupOpts = {
          render_modes = true;
        };
      };
    };
  };
  # vim.notes = {
  #   neorg = {
  #     enable = true;
  #     setupOpts.load = {
  #       "core.defaults".enable = true;
  #       "core.concealer".enable = true;
  #       "core.dirman".config.workspaces.notes = "~/Documents/Notes";
  #     };
  #   };
  # };
}
