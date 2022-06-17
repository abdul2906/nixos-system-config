{ config, pkgs, ... }:
let
  user = import ../../user/username.nix;
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.${user} = {
    xdg.configFile."waybar/config".source = ./config
    xdg.configFile."waybar/style.css".source = ./style.css
  };

  environment.systemPackages = with pkgs; [
    waybar
  ];
}
