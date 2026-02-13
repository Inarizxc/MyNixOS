{pkgs, ...}: {
  fonts.packages = with pkgs; [
    inter
    lato
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
  ];
}
