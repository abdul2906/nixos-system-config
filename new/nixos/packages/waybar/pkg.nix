{ config, pkgs, ... }:

let
  user = import ../../username.nix;
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.${user} = {
    xdg.configFile."waybar".source = ./waybar;
  };

  environment.systemPackages = with pkgs; [
    waybar
  ];
}

