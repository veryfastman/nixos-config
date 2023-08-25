{ pkgs, ... }:

{
    imports = [
        ./desktop
        ./misc
        ./scripts
        ./terminal
        ./wallpapers
    ];

    programs.home-manager.enable = true;

    home = {
        username = "donny";
        stateVersion = "23.05";
        packages = with pkgs; [
            ani-cli
            bluetuith
            brave
            brightnessctl
            cargo
            cava
            cinnamon.nemo
            clang
            cmus
            fish
            fzf
            git-crypt
            gnumake
            htop
            imv
            lazygit
            neofetch
            pavucontrol
            playerctl
            ripgrep
            rofimoji
            rustc
            starship
            streamlink
            sxhkd
            swaybg
            trash-cli
            texlive.combined.scheme-full
            unzip
            xdotool
            xdg-user-dirs
            xwallpaper
            wl-clipboard
            wtype
            yewtube
            yt-dlp
            zathura
            zip

            (mpv.override {scripts = [mpvScripts.mpris];})
        ];
    };
}
