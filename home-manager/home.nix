{ config, pkgs, ... }:

{
  home.username = "caien";
  home.homeDirectory = "/home/caien";
  
  imports = [
    ./apps
    ./devs
    ./themes
  ];

  home.packages = with pkgs; [
    bat    
    #brightnessctl
    #networkmanager_dmenu
    #gotop
    #btop
    tree
    vscodium
    librewolf
    #xfce.thunar
    #dunst
    #pavucontrol
    #libnotify
    #swww
    #feh
  ];

  home.file = {};

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    XCURSOR_THEME = "Bibata-Modern-Classic";
  };
  
 /* services = {
     udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "auto";
    };
  };  
*/

  home.stateVersion = "22.11"; 
  programs.home-manager.enable = true;
}

