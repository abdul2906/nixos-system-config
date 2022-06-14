# Workstation configuration
{ config, pkgs, ... }:

{
  imports = [ 
    ./base.nix
  ];

  # Set default terminal
  environment.sessionVariables.TERMINAL = [ "gnome-terminal" ];

  # Exclude unneeded gnome apps
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese
    gnome-music
    epiphany
    geary
    evince
    gnome-characters
    totem
    tali
    iagno
    hitori
    atomix
    gnome-maps
    yelp
    gnome-weather
    gnome-calendar
    gnome-contacts
  ]);

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;
  programs.xwayland.enable = true;

  # Install packages
  environment.systemPackages = with pkgs; [
    wget
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnome.gnome-tweaks
    quasselClient
    xwayland
    sublime4
    wl-clipboard
    deadbeef-with-plugins
    firefox-wayland
  ];

}
