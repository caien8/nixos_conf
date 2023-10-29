{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    #package = pkgs.hyprland;
    #package = (pkgs.hyprland.override { #inputs.hyprland.packages.${pkgs.system}.hyprland;
    #  enableXWayland = true;
    #  #enableNvidiaPatches = false;
    #});
    extraConfig = ''
    monitor=eDP-1,1920x1080,0x0,1
    
    # Execute your favorite apps at launch
    exec-once = waybar
    exec-once = /home/caien/.config/swww/swww.sh # start wallpaper daemon
    #exec-once = /home/caien/.config/waybar/launch.sh
    
    # source = ~/.config/hypr/myColors.conf
    #source = ~/.config/hypr/hyprpaper.conf

    #$w1 = hyprctl hyprpaper wallpaper "eDP-1,/home/caien/Wallpapers/apex_octane.jpg" 
    #$w2 = hyprctl hyprpaper wallpaper "eDP-1,/home/caien/Wallpapers/Dawm_2.jpg" 
    #$w3 = hyprctl hyprpaper wallpaper "eDP-1,/home/caien/Wallpapers/rain_world1.png" 

    env = XCURSOR_SIZE,24
    
    input {
        kb_layout = us
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =
        follow_mouse = 1
        touchpad {
            natural_scroll = no
        }
        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
    }
    
    general {
        gaps_in = 3
        gaps_out = 5
        border_size = 2
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)
        layout = dwindle
    }
    
    decoration { 
        rounding = 0
        #blur = yes
        #blur_size = 3
        #blur_passes = 1
        #blur_new_optimizations = on
        drop_shadow = yes
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(1a1a1aee)
    }
    
    animations {
        enabled = yes    
        bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
    }
    
    dwindle {
        pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = yes # you probably want this
    }
    
    master {
        new_is_master = true
    }
    
    gestures {
        workspace_swipe = off
    }
    
    device:epic-mouse-v1 {
        sensitivity = -0.5
    }
    
    # Example windowrule v1
    # windowrule = float, ^(kitty)$
    # Example windowrule v2
    # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
    # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
    
    
    $mainMod = SUPER    
    bind = $mainMod, Return, exec, kitty
    bind = $mainMod, C, killactive,
    bind = $mainMod SHIFT, Q, exit,
    bind = $mainMod, E, exec, dolphin
    bind = $mainMod, V, togglefloating,
    bind = $mainMod, R, exec, wofi --show drun
    bind = $mainMod, P, pseudo, # dwindle
    bind = $mainMod, J, togglesplit, # dwindle
    bind = $mainMod, W, exec, librewolf
    bind = $mainMod, F, exec, thunar
    
    # Move focus with mainMod + arrow keys
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d
    
    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 1, workspace, 1
    #bind=SUPER,1,exec,$w1     #SuperKey + 1 switches to wallpaper $w1 on DP-1 as defined in the variable

    bind = $mainMod, 2, workspace, 2
    #bind=SUPER,2,exec,$w2

    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10
    
    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10
    
    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1
    
    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
    
    # brightness control
    binde = , XF86MonBrightnessUp, exec, ~/.config/hypr/scripts/brightnesscontrol.sh i # increase brightness
    binde = , XF86MonBrightnessDown, exec, ~/.config/hypr/scripts/brightnesscontrol.sh d # decrease brightness
    
    bind  = , XF86AudioMute, exec, ~/.config/hypr/scripts/volumecontrol.sh -o m # toggle audio mute
    bind  = , XF86AudioMicMute, exec, ~/.config/hypr/scripts/volumecontrol.sh -i m # toggle microphone mute
    binde = , XF86AudioLowerVolume, exec, ~/.config/hypr/scripts/volumecontrol.sh -o d # decrease volume
    binde = , XF86AudioRaiseVolume, exec, ~/.config/hypr/scripts/volumecontrol.sh -o i # increase volume
    
    '';

  };
}