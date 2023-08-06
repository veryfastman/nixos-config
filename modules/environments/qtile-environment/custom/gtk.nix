{ config, pkgs, ... }:

{
    gtk = {
        enable = true;
        font.name = "RobotoMonoNerdFont";
        theme = {
            name = "Qogir-Dark";
            package = pkgs.qogir-theme;
        };
        iconTheme = {
            name = "PaperIconTheme";
            package = pkgs.paper-icon-theme;
        };
    };

    home.pointerCursor = {
        package = pkgs.capitaine-cursors;
        name = "capitaine-cursors";
        x11.enable = true;
        gtk.enable = true;
    };
}