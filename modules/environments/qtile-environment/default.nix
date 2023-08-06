{ config, pkgs, ... }:

{
    imports = [
        
    ];

    home.packages = with pkgs; [
        alacritty
        ani-cli
        brave
        brightnessctl
        cargo
        cava
        clang
        cmus
        fish
        flameshot
        fzf
        git-crypt
        gnumake
        htop
        lazygit
        mpv
        neofetch
        nsxiv
        playerctl
        ripgrep
        rofi
        rustc
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
}