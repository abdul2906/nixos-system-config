# Workstation configuration
{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot/efi";

    # Enable networkmanager
    networking.networkmanager.enable = true;

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Set X11 keymap
    services.xserver = {
      layout = "us";
      xkbVariant = "";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    # Set default terminal
    environment.sessionVariables.TERMINAL = [ "foot" ];

    # Novideo shit
    hardware.nvidia.modesetting.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.opengl.enable = true;

    # Gnome related settings
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
      firefox-wayland
      gnomeExtensions.appindicator
      gnomeExtensions.blur-my-shell
      gnome.gnome-tweaks
      quasselClient
      xwayland
      sublime4
      wl-clipboard
      deadbeef-with-plugins
  ];
}
