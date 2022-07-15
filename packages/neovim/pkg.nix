{ config, pkgs, home-manager, ...}:

{
  xdg.configFile."nvim".source = ./nvim;
}

