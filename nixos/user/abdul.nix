# User settings, applications and preferences
{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    ../pkgs/neovim/pkg.nix
    (import "${home-manager}/nixos")
    ../pkgs/clang-tools_14/pkg.nix
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
      nodePackages.coc-clangd
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
      clang
      gnumake

      # gay ming
      steam

      # le mega cringe
      vscode
    ];

    home-manager.users.abdul = {
      home.stateVersion = "18.09";
    };
}
