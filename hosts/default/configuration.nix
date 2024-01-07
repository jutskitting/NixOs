# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

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

  users.users.kit = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
    ];
  };

  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
        rofi
        light
        swaylock
        foot
      ];
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.etc."root/.config/nvim/init.vim".text = ''
    set number         " Show line numbers
    set tabstop=4      " Number of spaces tabs count for
    set shiftwidth=4   " Number of spaces to use for autoindent
    set expandtab      " Converts tabs to spaces
  '';

  environment.systemPackages = with pkgs; [
    wget
    ranger
    neovim
    git
  ];

  # Some programs need SUID wrappers, can be configured further or are
     
     
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  environment.sessionVariables = rec {
    EDITOR = "neovim";
  };

  nix.gc = {
        	automatic = true;
        	dates = "weekly";
        	options = "--delete-older-than 7d";
            };

  home-manager = {
     extraSpecialArgs = { inherit inputs; };
     users = {
       "kit" = import ./home.nix;
     };
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11";

}

