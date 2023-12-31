{ config, lib, ... }:

with lib;

let
  cfg = config.modules.hyprland;
in
{
  options.modules.hyprland = {
    enable = mkEnableOption "Hyprland";
    enableAnimations = mkEnableOption "Hyprland animations";
    roundBorders = mkEnableOption "Hyprland rounded corners";

    inactiveBorderColor = mkOption {
      type = types.str;
      default = "5c6370";
      description = "Inactive window border color";
    };

    activeBorderColor = mkOption {
      type = types.str;
      default = "ff444444";
      description = "Active window border color";
    };

    wallpaperCommand = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = literalExpression ''
        swaybg -i ~/Pictures/wallpapers/onedark_clouds.png
      '';
      description = "Command to set wallpaper";
    };
  };

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      settings = {
        monitor = [
          "eDP-1, 1920x1080@60,0x0,1"
        ];

        exec-once = [
          cfg.wallpaperCommand
          "waybar"
        ];

        input = {
          follow_mouse = 1;
          repeat_delay = 210;
          repeat_rate = 110;
          numlock_by_default = 1;
          accel_profile = "flat";
        };

        general = {
          gaps_in = 6;
          gaps_out = 8;
          border_size = 2;
          "col.inactive_border" = "rgb(${cfg.inactiveBorderColor})";
          "col.active_border" = "rgb(${cfg.activeBorderColor})";
          layout = "master";
        };

        gestures = {
          workspace_swipe = true;
        };

        master = {
          mfact = 0.5;
        };

        misc = {
          force_default_wallpaper = 0;
        };

        decoration = {
          rounding = mkIf cfg.roundBorders 5;
          blur = {
            enabled = true;
            size = 5;
            passes = 1;
            new_optimizations = true;
          };
        };

        bind = [
          "SUPER, W, killactive"
          "SUPER CTRL, Q, exit"

          "SUPER, F, togglefloating"
          "SUPER, M, fullscreen"

          "SUPER, h, movefocus,l"
          "SUPER, l, movefocus,r"
          "SUPER, k, movefocus,u"
          "SUPER, j, movefocus,d"
          "SUPER SHIFT, H, movewindow, l"
          "SUPER SHIFT, L, movewindow, r"
          "SUPER SHIFT, K, movewindow, u"
          "SUPER SHIFT, J, movewindow, d"
          "SUPER CTRL, H, resizeactive, -100 0"
          "SUPER CTRL, L, resizeactive, 100 0"
          "SUPER CTRL, K, resizeactive, 0 -100"
          "SUPER CTRL, J, resizeactive, 0 100"

          "SUPER, RETURN, exec, alacritty"

          "SUPER $mainMod, 1, workspace, 1"
          "SUPER $mainMod, 2, workspace, 2"
          "SUPER $mainMod, 3, workspace, 3"
          "SUPER $mainMod, 4, workspace, 4"
          "SUPER $mainMod, 5, workspace, 5"
          "SUPER $mainMod, 6, workspace, 6"
          "SUPER $mainMod, 7, workspace, 7"
          "SUPER $mainMod, 8, workspace, 8"
          "SUPER $mainMod, 9, workspace, 9"
          "SUPER $mainMod, 0, workspace, 10"
          "SUPER $mainMod SHIFT, 1, movetoworkspace, 1"
          "SUPER $mainMod SHIFT, 2, movetoworkspace, 2"
          "SUPER $mainMod SHIFT, 3, movetoworkspace, 3"
          "SUPER $mainMod SHIFT, 4, movetoworkspace, 4"
          "SUPER $mainMod SHIFT, 5, movetoworkspace, 5"
          "SUPER $mainMod SHIFT, 6, movetoworkspace, 6"
          "SUPER $mainMod SHIFT, 7, movetoworkspace, 7"
          "SUPER $mainMod SHIFT, 8, movetoworkspace, 8"
          "SUPER $mainMod SHIFT, 9, movetoworkspace, 9"
          "SUPER $mainMod SHIFT, 0, movetoworkspace, 10"
          "SUPER $mainMod, c, movetoworkspacesilent, special"
          "SUPER $mainMod, grave, togglespecialworkspace"

          "SUPER, S, exec, firefox"
          "SUPER, R, exec, rofi -show drun"
          "SUPER SHIFT, R, exec, rofi -show run"
          "SUPER CTRL, I, exec, ~/.local/bin/bookmark-type"
          "SUPER, P, exec, rofimoji"
          "SUPER, E, exec, nemo"
        ];

        binde = [
          ", xf86audioraisevolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +1%"
          ", xf86audiolowervolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -1%"
          ", xf86audiomute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
          ", xf86audioplay, exec, playerctl play-pause"
          ", xf86audionext, exec, playerctl next"
          ", xf86audioprev, exec, playerctl previous"
          ", xf86monbrightnessup, exec, brightnessctl set +2%"
          ", xf86monbrightnessdown, exec, brightnessctl set 2%-"
        ];

        bindm = [
          "SUPER, mouse:272, movewindow"
          "SUPER, mouse:273, resizewindow"
        ];

        animations = {
          enabled = cfg.enableAnimations;
          animation = [
            "workspaces, 1, 3, default"
            "windows, 1, 5, default"
            "fade, 1, 5, default"
          ];
        };

        windowrulev2 = [
          "float, class:.*"
          "tile, class:^(firefox)\$"
          "tile, class:^(Chromium-browser)\$"
          "tile, class:^(Alacritty)\$"
          # "opacity 0.9 0.9, class:^(Alacritty)\$"
        ];
      };
    };
  };
}
