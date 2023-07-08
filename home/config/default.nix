{ config, pkgs, ... }:

{
    imports = [
        ./neovim
        ./alacritty
        ./bash
        ./fish
        ./git
        ./rofi
        ./starship
        ./bookmarks
        ./qtile
    ];
}