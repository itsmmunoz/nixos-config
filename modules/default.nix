{ hostConfig, lib, ... }: {
  imports = [
    ./desktop/default.nix
    ./services/pipewire.nix
    ./system/appimage.nix
    ./system/boot.nix
    ./system/locale.nix
    ./system/users.nix
    ./system/swap.nix
    ./system/nix-settings.nix
  ]
  ++ lib.optionals hostConfig.features.virtualisation [ ./services/virtualisation.nix ]
  ++ lib.optionals hostConfig.features.printing [ ./services/printing.nix ]
  ++ lib.optionals hostConfig.features.flatpak [ ./services/flatpak.nix ]
  ++ lib.optionals hostConfig.features.fwupd [ ./services/fwupd.nix ];
}
