{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    nodePackages.npm
  ];
}
