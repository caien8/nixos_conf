{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    package = pkgs.helix;

    settings = {
      theme = "tokyonight";

      editor = {
        scrolloff = 10; 
        mouse = true;   
        middle-click-paste = true;  
        scroll-lines = 3; 
        shell = ["bash"];
        line-number = "relative";
        cursorline = true;
        gutters = ["diagnostics" "spacer" "line-numbers" "spacer" "diff"];
        auto-save = true;
        color-modes = true;
      };

      editor.statusline = {
        left = ["mode" "spacer" "version-control" "file-name" "file-encoding" "file-modification-indicator" ];
        center = ["spinner"];
        right = ["diagnostics" "workspace-diagnostics" "file-type" "position" "position-percentage" ];
        
        separator = "|";
        mode.normal = "Normal";
        mode.insert = "Insert";
        mode.select = "Select";
      };

      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };

      editor.indent-guides = {
        render = true;
        character = "┆"; # Some characters that work well: "▏", "╎", "┆", "┊", "⸽"
        skip-levels = 1;
      };

    };
    
  };
}