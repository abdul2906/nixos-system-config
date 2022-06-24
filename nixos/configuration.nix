# Master configuration file
{ config, pkgs, ... }:
let
  # Define user in ./username.nix
  # User should have corrsponding [user].nix file
  user = import ./user/username.nix;
in
{
  imports = [ 
    # User specific options
    ./user/${user}.nix

    # Hardware specific configuration
    # ./system/workstation/gnome.nix
    ./system/workstation/hyprland.nix
    # ./system/laptop/configuration.nix # WIP
    # ./system/server/configuration.nix # WIP
  ];

  nixpkgs.overlays = [
    (import ./overlays/discord.nix)
    (import ./overlays/electron.nix)
    (import ./overlays/waybar.nix)
  ];

  networking.hostName = "nixos";  

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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Nix configuration
  nix = {
    autoOptimiseStore = true;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Enable automatic updates
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos";
  };

  # System version
  system.stateVersion = "22.05";

  environment.systemPackages = with pkgs; [
    nix-diff
  ];
}
