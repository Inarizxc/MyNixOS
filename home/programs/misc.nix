{ ... }:
{
  programs = {
    yazi = {
      enable = true;
      enableNushellIntegration = true;
      shellWrapperName = "y";
      settings = {
        mgr = {
          sort_by = "mtime";
          sort_dir_first = true;
        };
      };
    };
    zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };
    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };
    direnv = {
      enable = true;
      enableNushellIntegration = true;
    };
    bottom.enable = true;
    skim.enable = true;
    fzf.enable = true;
  };
}
