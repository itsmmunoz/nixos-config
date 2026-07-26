{ hostConfig, ... }: {
  imports = [
    ./hardware.nix
    ../../modules/default.nix
  ];

  networking.hostName = hostConfig.hostname;
  networking.networkmanager.enable = true;

  system.stateVersion = "26.05";
}
