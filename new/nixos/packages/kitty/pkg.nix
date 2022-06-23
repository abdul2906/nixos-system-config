{ config, pkgs, ... }:
let
  user = import ../../username.nix;
in
{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.${user} = {
    xdg.configFile."kitty".source = ./kitty
  };

  environment.systemPackages = with pkgs; [
    kitty
  ];
}

