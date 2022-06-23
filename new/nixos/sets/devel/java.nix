{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk
    jre
  ];
}
