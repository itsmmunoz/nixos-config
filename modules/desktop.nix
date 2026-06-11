{ config, pkgs, ... }:

{
  # X11 / Wayland
  services.xserver.enable = true;
  programs.xwayland.enable = true;

  # Keyboard layout
  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };

  # Compositor
  programs.niri.enable = true;

  # Shell / greeter
  programs.dms-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableClipboardPaste = true;
  };

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/mmunoz";
    configFiles = [
      "/home/mmunoz/.config/DankMaterialShell/settings.json"
    ];
    logs = {
      save = true;
      path = "/tmp/dms-greeter.log";
    };
    quickshell.package = pkgs.quickshell;
  };

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Power management
  services.upower.enable = true;

  # Disks and mounting
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # Printing
  services.printing.enable = true;
  services.ipp-usb.enable = true;

  # Desktop packages
  environment.systemPackages = with pkgs; [
    ghostty
    xwayland-satellite
    corefonts
    vlc
    bibata-cursors
  ];
}
