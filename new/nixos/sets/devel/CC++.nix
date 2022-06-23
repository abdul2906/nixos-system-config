{ config, pkgs, ... }:

{
  # Unstable channel required
  environment.systemPackages = with pkgs; [
    gcc
    clang
    clang-tools_14
    gnumake
  ];
}

