# Base Workstation configuration
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Use systemd-boot as the bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Use NetworkManager for networking
  networking.networkmanager.enable = true;

  # Enable CUPS for printing support
  services.printing.enable = true;
  
  # Enable sound with pipewire.    
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

  # Enable nvidia drivers
  hardware.nvidia.modesetting.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;

  # Set keymap for X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable X11
  # services.xserver.enable = true;

  # Enable tablet support
  hardware.opentabletdriver.enable = true;
  hardware.opentabletdriver.daemon.enable = true;
  hardware.opentabletdriver.blacklistedKernelModules = [
    "hid-uclogic"
    "wacom"
  ];

  systemd.services.systemd-udev-settle.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

  networking.firewall.enable = false;
}

