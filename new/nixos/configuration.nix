{ config, pkgs, ... }:
let 
  user = import /etc/nixos/username.nix
in {
  imports = [
    # --User configuration--
    ./users/${user}.nix

    # --Hardware--
    ./hardware/workstation.nix
    # ./hardware/laptop.nix

    # --Desktop Environment--
    # ./environment/hyprland/env.nix
    # ./environment/gnome/env.nix
    # ./environment/sway/env.nix

    # --Sets--

  ];
} 