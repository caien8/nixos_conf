{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono"]; })
    pkgs.maple-mono-SC-NF
  ];
}