{...}: {
  vim.languages = {
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
}
