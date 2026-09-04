{
  pkgs,
  lib,
  hostConfig,
  ...
}:
{
  users.users.${hostConfig.username} = {
    isNormalUser = true;
    description = hostConfig.fullName;
    extraGroups = [
      "networkmanager"
      "wheel"
      "ydotool"
    ]
    ++ lib.optionals hostConfig.features.virtualisation [
      "docker"
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
