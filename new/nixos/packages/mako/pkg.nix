{ config, pkgs, ... }:
let
  user = import ../../username.nix;
in
{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.${user} = {
    programs.mako.anchor = "botton-right";
    programs.mako.defaultTimeout = 4000;
  };

  environment.systemPackages = with pkgs; [
    mako
  ];
}

