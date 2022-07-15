{ config, pkgs, home-manager, ...};

let
  user = import ../../current/username.nix;
in
{
  home-manager.users.${user} = {
    xdg.configFile."nvim".source = ./nvim;
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
  };
}

