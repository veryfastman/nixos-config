{ config, pkgs, ... }:

{
    home = {
        username = "donny";
        homeDirectory = "/home/donny";
    };

    fonts.fontconfig.enable = true;

    imports = [
        ../home
    ];

    home.file.".local/bin" = {
        source = ./scripts;
        recursive = true;
        executable = true;
    };

    home.packages = with pkgs; [
        alacritty
        ani-cli
        brave
        brightnessctl
        cava
        clang
        cmus
        fish
        flameshot
        fzf
        gnumake
        htop
        mpv
        mypy
        neofetch
        nsxiv
        pass
        playerctl
        ripgrep
        rofi
        starship
        streamlink
        sxhkd
        xfce.thunar
        tmux
        trash-cli
        unzip
        xdotool
        xdg-user-dirs
        xterm
        xwallpaper
        yewtube
        yt-dlp
        zip
    ];

    programs.home-manager.enable = true;
    home.stateVersion = "23.05";
}
