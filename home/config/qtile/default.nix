{ pkgs, config, ... }:

{
    home.file.".config/qtile/config.py".source = ./config.py;        
}