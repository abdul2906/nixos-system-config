# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let 
#  profile = import ../current/profile.nix;
  username = import ../current/username.nix;
in
{
  imports =
    [
      ../hardware-configuration.nix
#      ../profile/${profile}/env.nix
      ../profile/kde/env.nix
      ../user/${username}.nix

      ../sets/common.nix
      ../sets/devel/c.nix
      ../sets/devel/git.nix
      ../sets/devel/java.nix
      ../sets/devel/node.nix
      ../sets/devel/rust.nix
      ../sets/games/steam.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "workstation";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

  # timezone
  time.timeZone = "Europe/Berlin";

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.layout = "us";

  # Enable printing
  services.printing.enable = true;

  # sound
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # move to sets
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    firefox
    git
    unzip
  ];

  # Nvidia drivers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.nvidia.modesetting.enable = true;

  system.stateVersion = "22.05"; # Do not edit
}

