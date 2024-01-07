{ config, pkgs, ... }:

{
  home.username = "kit";
  home.homeDirectory = "/home/kit";

  home.stateVersion = "23.11";

    wayland.windowManager.sway = {
      enable = true;
      config = rec {
        modifier = "Mod4";
      };
  };

  fonts.fontconfig.enable = true;

  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    pkgs.hello
    pkgs.alacritty
    pkgs.neofetch
    pkgs.brave
    pkgs.wayland
    pkgs.ranger
    pkgs.light
    pkgs.sway

    (pkgs.writeShellScriptBin "my-hello" ''
      echo "Hello, ${config.home.username}!"
    '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {

  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/kit/etc/profile.d/hm-session-vars.sh

  home.sessionVariables = {
     EDITOR = "neovim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
