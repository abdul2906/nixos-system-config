{ config, pkgs, ... }:

let
  user = import ../../username.nix;
in
{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.${user} = {
    xdg.configFile."nvim".source = ./nvim; 
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
  };

  # Set neovim as the manpager
  #environment.sessionVariables = rec {
  #  MANPAGER = "/bin/sh -c \"col -b | nvim -c 'set ft=man nomod noma'\"";
  #};
}

