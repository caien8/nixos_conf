{ pkgs, ... }:
{
gtk = {
  enable = true;
  font = {
    name = "Sofia Pro 13";
    size = 12;
  };

  theme = {
    name = "Tokyonight-Dark-BL";
    package = pkgs.tokyo-night-gtk;
  };

  iconTheme = {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
  };

  cursorTheme = {
    #name = "Bibata-Spirit";
    name = "Bibata-Modern-Classic";
    size = 26;
    #package = pkgs.bibata-cursors-translucent;
    package = pkgs.bibata-cursors;
  };

  gtk3.extraConfig = {
    gtk-button-images = 1;
    gtk-menu-images = 1;
    gtk-enable-event-sounds = 1;
    gtk-enable-input-feedback-sounds = 1;
    gtk-xft-antialias= 1 ;
    gtk-xft-hinting = 1;
    gtk-xft-hintstyle = "hintfull";  
    gtk-cursor-blink = true;
    gtk-recent-files-limit = 20;
    gtk-application-prefer-dark-theme=1;
  };
  gtk3.extraCss = "
    VteTerminal, vte-terminal {
    padding: 13px;
    }";
  gtk3.bookmarks = [
    file:///home/caien/Documents
    file:///home/caien/Downloads
    file:///home/caien/Pictures
    file:///home/caien/Music
    file:///home/caien/Videos
  ];
};
/*
fonts.fontconfig.enable = true;
home.packages = [
  (pkgs.nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono"]; })
];
*/
}
