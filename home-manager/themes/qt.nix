{ pkgs, ... }:
{
  qt = {
    enable = true;
    style = {
      name = "adwaita-dark";
      package = with pkgs ; [ adwaita-qt libsForQt5.qt5.qtgraphicaleffects ] ;
      };

  };
}