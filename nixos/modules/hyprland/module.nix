{ config, pkgs, lib, ... }:

let 
  dbus-hyprland-environment = pkgs.writeTextFile {
    name = "dbus-hyprland-environment";
    destination = "/bin/dbus-hyprland-environment";
    executable = true;

    text = ''
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=hyprland
      systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };

    configure-gtk = pkgs.writeTextFile {
      name = "configure-gtk";
      destination = "/bin/configure-gtk";
      executable = true;
      text = let
        schema = pkgs.gsettings-desktop-schemas;
        datadir = "${schema}/share/gesettings/schemas/${schema.name}";
      in ''
        export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
        gnome_schema=org.gnome.desktop.interface
        gesettings set $gnome_schema gtk-theme 'Adwaita'
        '';
    };

    flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
    hyprland = (import flake-compat {
      src = builtins.fetchTarball "https://github.com/vaxerski/Hyprland/archive/master.tar.gz";
    }).defaultNix;
in
{
  environment.systemPackages = with pkgs; [
    alacritty
    dbus-hyprland-environment
    configure-gtk
    wayland
    glib
    gnome3.adwaita-icon-theme
    grim
    wl-clipboard
    bemenu
    wlr-randr
    xorg.xhost
  ];

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    gtkUsePortal = true;
  };

  imports = [
    hyprland.nixosModules.default
  ];

  programs.hyprland.enable = true;

  services.xserver.displayManager.sddm.enable = true;
  programs.xwayland.enable = true;

  environment.sessionVariables = rec {
    GBM_BACKEND = "nvidia-drm";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
    WLR_DRM_NO_ATOMIC = "1";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
#    QT_QPA_PLATFORM = "wayland";
#    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    GDK_BACKEND = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };
}

