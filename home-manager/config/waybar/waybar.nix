{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    package = (pkgs.waybar.overrideAttrs (oldAttrs : {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }));
    settings = {
      mainBar = {
      layer = "top";
      position = "top";
      fixed-center = "true";

      modules-left = [ "custom/l_end" "cpu" "custom/padd" "memory" "custom/r_end" "custom/l_end" "wlr/workspaces" "custom/r_end" ];
      modules-center = [ "custom/l_end" "clock" "custom/r_end" ];
      modules-right = [ "custom/l_end" "network" "custom/r_end" "custom/l_end" "pulseaudio" "pulseaudio#microphone" "custom/padd" "battery" "custom/r_end" ];
  
      #* LEFT MODULES 
      "cpu" = {
        interval = 10;
        format = "󰍛 {usage}%";
      }; 
      "memory" = {
        interval = 30;
        format = "󰾆 {percentage}%";
        format-alt = "󰾅 {used}GB";
        max-length = 10;
        tooltip = true;
        tooltip-format = " {used:0.1f}GB/{total:0.1f}GB";
      };
      "wlr/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        on-click = "activate";
        on-scroll-up = "hyprctl dispatch workspace e-1";
        on-scroll-down = "hyprctl dispatch workspace e+1";
        persistent_workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
            "6" = [];
            "7" = [];
            "8" = [];
            "9" = [];
            "10" = [];
        };
      };

      #* CENTER MODULES
      "clock" = {
        format = "{: %I:%M %p 󰃭 %a %d}";
        format-alt = "{:󰥔 %H:%M  %b %Y}";
        tooltip-format = "<tt><big>{calendar}</big></tt>";
      };

      #* RIGHT MODULES
      "network" = {
        #interface = "wlp2*"; # (Optional) To force the use of this interface
        format-wifi = "󰤨 {essid}";
        format-ethernet = "󱘖 Wired";
        tooltip-format = "󱘖 {ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes}";
        format-linked = "󱘖 {ifname} (No IP)";
        format-disconnected = " Disconnected";
        format-alt = "󰤨 {signalStrength}%";
        interval = 5;
        on-click = "networkmanager_dmenu -l 9 -nf cyan -sb cyan -sf black";
      };
      #"custom/cliphist" = {
      #    format = "{}";
      #    exec = "echo ; echo 󰅇 clipboard history";
      #    on-click = "sleep 0.1 && ~/.config/waybar/scripts/cliphist.sh c ${mod_pos}";
      #    #on-click-right = "sleep 0.1 && ~/.config/waybar/scripts/cliphist.sh d";
      #    on-click-middle = "sleep 0.1 && ~/.config/waybar/scripts/cliphist.sh w ${mod_pos}";
      #    interval = 86400; # once every day
      #    tooltip = true;
      #};
      "backlight" = {
          #device = "acpi_video1";
          format = "{icon} {percent}%";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
          on-scroll-up = "brightnessctl set +1%";
          on-scroll-down = "brightnessctl set 1%-";
          interval = 2;
      };
      "pulseaudio" = {
          format = "{icon} {volume}";
          format-muted = "婢";
          on-click = "pavucontrol -t 3";
          on-click-middle = "~/.config/hypr/scripts/volumecontrol.sh -o m";
          on-scroll-up = "~/.config/hypr/scripts/volumecontrol.sh -o i";
          on-scroll-down = "~/.config/hypr/scripts/volumecontrol.sh -o d";
          tooltip-format = "{icon} {desc} // {volume}%";
          scroll-step = 5;
          format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
          };
      };
  
      "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " ";
          format-source-muted = " ";
          on-click = "pavucontrol -t 4";
          on-click-middle = "~/.config/hypr/scripts/volumecontrol.sh -i m";
          on-scroll-up = "~/.config/hypr/scripts/volumecontrol.sh -i i";
          on-scroll-down = "~/.config/hypr/scripts/volumecontrol.sh -i d";
          tooltip-format = "{format_source} {source_desc} // {source_volume}%";
          scroll-step = 5;
      };
  
      "battery" = {
          bat = "BATT";
          interval = 2;
          full-at = 95;
          states = {
              good = 80;
              critical = 20;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
      };

      # CUSTOM MODULES 
      "custom/l_end" = {
        format = " ";
        interval = "once";
        tooltip = false;
      };

      "custom/r_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
      };
      "custom/padd" = {
          format = " ";
          interval = "once";
          tooltip = false;
      };

      };
    };
  };

}
