{ config, pkgs, ... }:

{
  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;
  # Why no workey
  # boot.initrd.enable = false;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Networking
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
  networking.firewall.enable = false;
  networking.hostName = "nixos";

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # GPU
  hardware.nvidia.modesetting.enable = true;
  services.xserver.videoDriver = [ "nvidia" ];
  hardware.opengl.enable = true;

  # Set keymap for X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
}

