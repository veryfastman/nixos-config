{ config, pkgs, nur, ... }:

{
    imports = [
        ../machines/nixos_vm
        # ../machines/laptop
    ];

    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/vda";
    boot.loader.grub.useOSProber = true;

    time.timeZone = "America/Los_Angeles";

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    services.printing.enable = true;

    fonts = {
        fonts = with pkgs; [
            material-design-icons
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
            (nerdfonts.override { fonts = [ "DroidSansMono" "FiraCode" "Hack" "JetBrainsMono" "RobotoMono" ]; })
        ];

        enableDefaultFonts = false;

        fontconfig.defaultFonts = {
            serif = [ "Noto Serif" "Noto Color Emoji" ];
            sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
            monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
            emoji = [ "Noto Color Emoji" ];
        };
    };

    networking.hostName = "nixos";
    # networking.wireless.enable = true;
    networking.networkmanager.enable = true;

    services.xserver.enable = true;
    services.xserver.displayManager.startx.enable = true;
    services.xserver.windowManager.qtile.enable = true;
    services.xserver = {
        layout = "us";
        xkbVariant = "";
    };

    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
    users.users.donny = {
        isNormalUser = true;
        description = "donny";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    nixpkgs.config.allowUnfree = true;

    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
        curl
        gcc
        git
        neovim
        wget
	    xclip
    ];

    system.stateVersion = "23.05";
}