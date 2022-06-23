{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
    ../packages/neovim/pkg.nix
    ../packages/kitty/pkg.nix
    ../sets/devel/CC++.nix
    ../sets/devel/git.nix
    ../sets/devel/java.nix
    ../sets/devel/node.nix
    ../sets/games/steam.nix
  ];

  # Create user
  users.users.abdul = {
    isNormalUser = true;
    description = "abdul";
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "docker"
      "networkmanager"
    ];
  };

  # Locale and timezone
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.utf8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.utf8";
    LC_IDENTIFICATION = "de_DE.utf8";
    LC_MEASUREMENT = "de_DE.utf8";
    LC_MONETARY = "de_DE.utf8";
    LC_NAME = "de_DE.utf8";
    LC_NUMERIC = "de_DE.utf8";
    LC_PAPER = "de_DE.utf8";
    LC_TELEPHONE = "de_DE.utf8";
    LC_TIME = "de_DE.utf8";
  };

  # Disable sudo password
  security = {
    sudo.wheelNeedsPassword = false;
  };

  # Session variables
  environment.sessionVariables = rec {
    EDITOR = "nvim";
  };

  # Shell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  environment.binsh = "${pkgs.dash}/bin/dash";

  # Set home-manager version
  home-manager.users.abdul = {
    home.stateVersion = "22.11";
  };
}

