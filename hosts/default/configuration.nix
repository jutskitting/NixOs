# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:
let
    shellInit = ''
        alias rebuild='sudo nixos-rebuild switch --flake /etc/nixos#default'
        alias lg='lazygit'
        export EDITOR=nvim
        export BROWSER=brave
    '';
in
{
    imports =
    [
        ./hardware-configuration.nix
    ];

    environment.interactiveShellInit = shellInit;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "NixOS"; # Define your hostname.
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
    time.timeZone = "America/New_York";

    i18n.defaultLocale = "en_US.UTF-8";

    programs.light.enable = true;
    security.polkit.enable = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];


    # Enable CUPS to print documents.
    # services.printing.enable = true;

    # Enable sound.
    sound.enable = true;
    hardware.pulseaudio.enable = true;

    services.xserver.libinput.enable = true;

    hardware.bluetooth.enable = true; # enables support for Bluetooth
    hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

    services.blueman.enable = true;

    users.users.kit = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" ];
        packages = with pkgs; [
            brave
            ueberzugpp
            zathura
            lazygit
            neofetch
            tmux
            taskwarrior
            taskwarrior-tui
        ];
    };

    programs.sway = {
        enable = true;
        extraPackages = with pkgs; [
            rofi
            light
            swaylock
            swayidle
            foot
          ];
    };

    environment.etc."sway/config".source = lib.mkForce (pkgs.callPackage ../../modules/nixos/sway.nix {});

    environment.systemPackages = with pkgs; [
        wget
        ranger
        git
        wl-clipboard
        brave
        lf
    ];

    # system.userActivationScripts = {
    #  extraUserActivation = {
    #      text = '' '';
    #     deps = [];
    #   };
    # };

    # Some programs need SUID wrappers, can be configured further or are
         
         
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    environment.sessionVariables = rec {
        EDITOR = "nvim";
    };

    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
    };

    services.logind.extraConfig = ''
        IdleAction=suspend
        IdleActionSec=10min
    '';


    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # This option defines the first version of NixOS you have installed on this particular machine,
    # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
    system.stateVersion = "23.11";

}

