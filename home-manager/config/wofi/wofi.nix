{
  programs.wofi = {
    enable = true;

    settings = {
      #height = 550;  
      height = "30%";
      #width = 420;
      width = "25%";
      location = "center";
      show = "drun,filebrowser,window,run";
      show-icons = true;
      display-drun = "";
	    display-run = "";
	    display-filebrowser = "";
	    display-window = "";
	    drun-display-format = "{name}";
	    window-format = "{w}{t}";
      matching = "fuzzy";
      prompt = " Search";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 28;
      gtk_dark = false;
      term = "kitty";
      font = "JetBrainsMono Nerd Font 10";
      #font = "FiraCode Nerd Font Mono";
	    icon-theme = "Tela-circle-dracula";
    };

    style = ''
      * {
        transition: 0.2s;
      }
      
      window {
        font-size: 13px;
        margin: 0px;
        /*border: 2px solid #c0caf5;*/
        background-color: #1a1b26;
        background-color: transparent;
        border-radius: 16px;
      }

      mainbox {
        background-color: #1a1b26;;
        children: [ mode-switcher, listview ];
      }
      
      #input {
          padding: 4px;
          margin: 20px;
          padding-left: 20px;
          border: none;
          color: #fff;
          font-weight: bold;
          /*background: linear-gradient(90deg, #cba6f7 0%, #94e2d5 100%);*/
          background: transparent;
         	outline: none;
          border-radius: 13px;
      }
      
      #input image {
          color: #fff;
      }
      
      #input:focus {
          border: none;
         	outline: none;
      }
      
      #inner-box {
          margin: 20px;
          margin-top: 0px;
          border: none;
          color: #c0caf5;
          border-radius: 12px;
      }
      
      #inner-box * {
          transition: none;
      }
      
      #outer-box {
          margin: 0px;
          border: none;
          padding: 0px;
          border-radius: 13px;
      }
      
      #scroll {
          margin-top: 5px;
          border: none;
          border-radius: 13px;
          margin-bottom: 5px;
      }
      
      #text:selected {
          color: #fff;
          font-weight: bold;
      }
      
      #img {
          margin-right: 20px;
          background: transparent;
      }
      
      #text {
          margin: 0px;
          border: none;
          padding: 0px;
          background: transparent;
          color: #fff;
      }
      
      #entry {
          margin: 0px;
          border: none;
          border-radius: 13px;
          background-color: transparent;
          min-height:32px;
          font-weight: bold;
      }
      
      #entry:selected {
          outline: none;
          margin: 0px;
          border: none;
          border-radius: 13px;
          /*background: linear-gradient(90deg, #cba6f7 0%, #94e2d5 100%);*/
          background: #7aa2f7;
      }
    '';

  };
}
