{ config, pkgs, ... }:

{
    home.file.".xinitrc" = {
        text = ''
            #!/bin/sh

            exec xwallpaper --zoom ~/Pictures/early_snow_town.jpg &
            exec sxhkd &
            exec picom --backend=glx &
            exec xset r rate 210 110 &
            qtile start
        '';
        executable = true;
    };
}
