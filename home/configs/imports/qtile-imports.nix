{ config, pkgs, ... }:

{
    imports = [
        ../display/wallpaper
        ../display/gtk.nix
        ../display/picom.nix
        ../display/qtile.nix
        ../display/xinit.nix

        ../terminal/alacritty
        ../terminal/neovim
        ../terminal/bash.nix
        ../terminal/fish.nix
        ../terminal/git.nix
        ../terminal/starship.nix
        ../terminal/tmux.nix
        ../terminal/lf.nix

        ../misc/rofi
        ../misc/bookmarks.nix
        ../misc/firefox.nix
        ../misc/sxhkd.nix
    ];

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
        git-crypt
        gnumake
        htop
        lazygit
        mpv
        mypy
        neofetch
        nsxiv
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
}