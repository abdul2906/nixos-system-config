{ config, pkgs, ... }:

{
  imports = [
    ../packages/neovim/pkg.nix
  ];

  environment.systemPackages = with pkgs; [
    firefox
    wget
    unzip
    tar
  ];
}
