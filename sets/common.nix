{ config, pkgs, ... }:

{
  imports = [
  ];

  environment.systemPackages = with pkgs; [
    firefox
    wget
    unzip
    easyeffects
  ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
  };
}
