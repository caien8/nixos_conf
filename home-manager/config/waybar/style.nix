{
  programs.waybar = {
    style = ''

*{
    border: none;
    font-family: "JetBrainsMono Nerd Font";
    font-weight: bold;
    font-size: 13px;
    min-height: 10px;
}

@import "themes/Catppuccin-Mocha.css";

window#waybar {
    background: @bar-bg;
}

/********************************/
/********** MODULES **********/
#workspaces,
#clock,
#cpu,
#memory,
#network,
#custom-cliphist,
#backlight,
#pulseaudio,
#battery,
#custom-l_end,
#custom-r_end,
#custom-padd {
    color: @main-color;
    background: @main-bg;
    opacity: 1;
    margin: 4px 0 1px 0;
    padding: 0 2px 0 2px;
}

/********************************/
/** WORKSPACES */

#workspaces button {
    box-shadow: none;
	text-shadow: none;
    padding: 0px;
    border-radius: 9px;
    margin-top: 3px;
    margin-bottom: 3px;
    padding-left: 3px;
    padding-right: 3px;
    color: @wb-color;
    animation: gradient_f 20s ease-in infinite;
    transition: all 0.5s cubic-bezier(.55,-0.68,.48,1.682);
}

#workspaces button.active {
    background: @wb-act-bg;
    color: @wb-act-color;
    margin-left: 3px;
    padding-left: 12px;
    padding-right: 12px;
    margin-right: 3px;
    animation: gradient_f 20s ease-in infinite;
    transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
}

#workspaces button:hover {
    background: @wb-hvr-bg;
    color: @wb-hvr-color;
    padding-left: 3px;
    padding-right: 3px;
    animation: gradient_f 20s ease-in infinite;
    transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
}

/********************************/

#custom-r_end {
    border-radius: 0px 21px 21px 0px;
    margin-right: 9px;
    padding-right: 3px;
}

#custom-l_end {
    border-radius: 21px 0px 0px 21px;
    margin-left: 9px;
    padding-left: 3px;
}

    '';
  };
}
