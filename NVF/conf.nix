{
  pkgs,
  lib,
  ...
}
: {
  imports = [
    ./keymaps.nix
    ./plugins/bundle.nix
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

    undoFile.enable = true;

    spellcheck.languages = ["en" "ru"];
  };
}
