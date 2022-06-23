{ config, pkgs, ... }:
let 
  user = import ./username.nix;
in {
  imports = [
    # --User configuration--
    ./users/${user}.nix

    # --Hardware--
    ./hardware-configuration.nix
    ./hardware/workstation.nix
    # ./hardware/laptop.nix

    # --Desktop Environment--
    ./environment/hyprland/env.nix
    # ./environment/gnome/env.nix
    # ./environment/sway/env.nix
  ];

  # Overlays
  nixpkgs.overlays = [
   (import ./overlays/discord.nix) 
   (import ./overlays/electron.nix)
   (import ./overlays/waybar.nix)
  ];

  # Nix
  nixpkgs.config.allowUnfree = true;
  nix = {
    autoOptimiseStore = true;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Auto update with unstable channel
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # System version
  system.stateVersion = "22.05";
} 

