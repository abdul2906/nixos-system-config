{ config, pkgs, ... }:

let
  user = import ../../username.nix;
in
{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.${user} = {
    xdg.configFile."waybar".source = ./waybar;
  };

  environment.systemPackages = with pkgs; [
    waybar
  ];
}

