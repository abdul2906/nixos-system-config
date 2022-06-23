{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
    ../../modules/hyprland/module.nix
  ];

  environment.systemPackages = with pkgs; [
    firefox-wayland
    xorg.xhost
    unzip
  ];
}

