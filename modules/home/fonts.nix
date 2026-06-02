{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
    noto-fonts
  ];
  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts.emoji = [ "Noto Color Emoji" ];
}
