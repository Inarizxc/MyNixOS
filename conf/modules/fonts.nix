{pkgs, ...}: {
  fonts.packages = with pkgs; [
    inter
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}
