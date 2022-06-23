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
    programs.mako.anchor = "top-right";
    programs.mako.defaultTimeout = 4;
  };

  environment.systemPackages = with pkgs; [
    mako
  ];
}
