{ config, pkgs, ... }:

{
  users.users.t = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" ];
  };
}

