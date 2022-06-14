# User settings, applications and preferences
{ config, pkgs, ... }:

{
  imports = [
    ../pkgs/neovim/pkg.nix
  ];

  users.users.abdul = {
    isNormalUser = true;
    description = "abdul";
    extraGroups = [ 
      "networkmanager" 
      "wheel" 
      "audio" 
      "video" 
      "docker" 
      ];
    };

    # Session variables
    environment.sessionVariables = rec {
      EDITOR          = "nvim";
      NIXOS_OZONE_WL  = "1";
    };

    # Disable sudo password prompt
    security = {
      sudo.wheelNeedsPassword = false;
    };

    # Change default shell to fish
    programs.fish.enable = true;
    users.defaultUserShell = pkgs.fish;

    # Change /bin/sh to dash
    environment.binsh = "${pkgs.dash}/bin/dash";

    # User applications
    environment.systemPackages = with pkgs; [
      # Personal applications
      neofetch
      discord
      neovim
      obsidian
      spotify
      btop
      nicotine-plus
      yt-dlp
      shotcut
      obs-studio

      # Development
      git
      gcc
      nodejs
      nodePackages.npm
      rustc
      cargo
      jdk
      jre
    ];
}
