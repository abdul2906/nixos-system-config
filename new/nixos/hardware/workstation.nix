{ config, pkgs, ... }:

{
  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.initrd.enable = false;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Networking
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
  networking.firewall.enable = false;

  # Sound
  sound.enable = true;
  hardware.pulseuadio.enable = false;
  security.rtkit.enable = truel
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # GPU
  hardware.nvidia.modsetting.enable = true;
  services.xserver.videoDriver = [ "nvidia" ];
  hardware.opengl.enable = true;
}

