{ ... }: {
  imports = [
    ./overlay.nix
    ./packages.nix
    ./xserver.nix
  ];

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
}
