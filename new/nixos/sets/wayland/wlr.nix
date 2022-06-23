{ config, pkgs, lib, ... }:

{
  imports = [
    ../../packages/waybar/pkg.nix
    ../../packages/mako/pkg.nix
  ];

  environment.systemPackages = with pkgs; [
    wayland
    gnome3.adwaita-icon-theme
    gnome.nautilus

    # Utils
    grim
    wl-clipboard
    bemenu
    wlr-randr
    swaybg
  ];
}
