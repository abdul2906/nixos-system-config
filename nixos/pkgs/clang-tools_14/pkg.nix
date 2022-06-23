{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> { 
    config = {
      allowUnfree = true;
    };
  };
in {
  environment.systemPackages = with pkgs; [
    unstable.clang-tools_14
  ];
}
