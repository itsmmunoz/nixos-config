{ pkgs, hostConfig, ... }: {
  users.users.${hostConfig.username} = {
    isNormalUser = true;
    description = hostConfig.fullName;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
