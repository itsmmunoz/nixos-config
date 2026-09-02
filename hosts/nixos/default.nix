{ hostConfig, ... }: {
  imports = [
    ./hardware.nix
    ../../modules/default.nix
  ];

  networking.hostName = hostConfig.hostname;
  networking.networkmanager.enable = true;

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
      priority = -2;
    }
  ];

  system.stateVersion = "26.05";
}
