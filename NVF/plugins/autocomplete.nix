{...}: {
  vim = {
    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
      sourcePlugins.ripgrep.enable = true;
      sourcePlugins.spell.enable = true;
    };

    snippets.luasnip.enable = true;
  };
}
