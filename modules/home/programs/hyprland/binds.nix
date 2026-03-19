{ hostname, pkgs, ... }:
let
  inherit (import ../../../../hosts/${hostname}/variables.nix)
    browser
    terminal
    fileManager
    mainMod
    ;
in
{
  wayland.windowManager.hyprland.settings = {
    "$modifier" = mainMod;

    # -----------------------------------------------------
    # Standard Keybindings
    # -----------------------------------------------------
    bind = [
      # Caelestia specific
      "$modifier,SPACE,global,caelestia:launcher"
      "$modifier SHIFT,L,global,caelestia:lock"
      "$modifier SHIFT,V,exec,caelestia clipboard"

      # Apps
      "$modifier,Return,exec,uwsm app -- ${terminal}"
      "$modifier,B,exec,uwsm app -- ${browser}"
      "$modifier,E,exec,uwsm app -- ${fileManager}"
      "$modifier,D,exec,uwsm app -- discord"
      "$modifier,O,exec,uwsm app -- obs"
      "$modifier,C,exec,hyprpicker -a"
      "$modifier,G,exec,uwsm app -- gimp"
      "$modifier,T,exec,pypr toggle term"
      "$modifier,M,exec,pavucontrol"

      # Window Management
      "$modifier,Q,killactive,"
      "$modifier,P,pseudo,"
      "$modifier,V,exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      "$modifier SHIFT,I,togglesplit,"
      "$modifier,F,fullscreen,"
      "$modifier SHIFT,F,togglefloating,"
      "$modifier ALT,F,workspaceopt, allfloat"
      "$modifier SHIFT,C,exit,"

      # Focus and Movement (HJKL + Arrows)
      "$modifier,h,movefocus,l"
      "$modifier,l,movefocus,r"
      "$modifier,k,movefocus,u"
      "$modifier,j,movefocus,d"
      "$modifier SHIFT,h,swapwindow,l"
      "$modifier SHIFT,l,swapwindow,r"
      "$modifier SHIFT,k,swapwindow,u"
      "$modifier SHIFT,j,swapwindow,d"

      "$modifier SHIFT,left,movewindow,l"
      "$modifier SHIFT,right,movewindow,r"
      "$modifier SHIFT,up,movewindow,u"
      "$modifier SHIFT,down,movewindow,d"

      "$modifier ALT, left, swapwindow,l"
      "$modifier ALT, right, swapwindow,r"
      "$modifier ALT, up, swapwindow,u"
      "$modifier ALT, down, swapwindow,d"

      # Workspaces
      "$modifier,1,workspace,1"
      "$modifier,2,workspace,2"
      "$modifier,3,workspace,3"
      "$modifier,4,workspace,4"
      "$modifier,5,workspace,5"
      "$modifier,6,workspace,6"
      "$modifier,7,workspace,7"
      "$modifier,8,workspace,8"
      "$modifier,9,workspace,9"
      "$modifier,0,workspace,10"
      "$modifier SHIFT,SPACE,movetoworkspace,special"
      "$modifier SHIFT,1,movetoworkspace,1"
      "$modifier SHIFT,2,movetoworkspace,2"
      "$modifier SHIFT,3,movetoworkspace,3"
      "$modifier SHIFT,4,movetoworkspace,4"
      "$modifier SHIFT,5,movetoworkspace,5"
      "$modifier SHIFT,6,movetoworkspace,6"
      "$modifier SHIFT,7,movetoworkspace,7"
      "$modifier SHIFT,8,movetoworkspace,8"
      "$modifier SHIFT,9,movetoworkspace,9"
      "$modifier SHIFT,0,movetoworkspace,10"

      "$modifier CONTROL,right,workspace,e+1"
      "$modifier CONTROL,left,workspace,e-1"
      "$modifier,mouse_down,workspace, e+1"
      "$modifier,mouse_up,workspace, e-1"
      "ALT,Tab,cyclenext"
      "ALT,Tab,bringactivetotop"
    ];

    # -----------------------------------------------------
    # Media & Brightness (Repeatable + Works while locked)
    # -----------------------------------------------------
    bindel = [
      # Volume
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && caelestia shell osd volume"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && caelestia shell osd volume"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && caelestia shell osd volume"

      # Brightness
      ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
    ];

    # -----------------------------------------------------
    # Media Controls & Switches
    # -----------------------------------------------------
    bindl = [
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioPause, exec, playerctl play-pause"
      ",XF86AudioNext, exec, playerctl next"
      ",XF86AudioPrev, exec, playerctl previous"

      ",switch:on:Lid Switch, exec, caelestia shell lock"

      # Optional: Turn off the screen immediately on lid close to save battery
      ",switch:on:Lid Switch, exec, hyprctl dispatch dpms off"

      # Turn screen back on when lid opens
      ",switch:off:Lid Switch, exec, hyprctl dispatch dpms on"
    ];

    # -----------------------------------------------------
    # Mouse Bindings
    # -----------------------------------------------------
    bindm = [
      "$modifier, mouse:272, movewindow"
      "$modifier, mouse:273, resizewindow"
    ];
  };
}
