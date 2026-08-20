{ desktop, hostConfig, ... }: {
  home.username = hostConfig.username;
  home.homeDirectory = "/home/${hostConfig.username}";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  imports = [
    (./desktop + "/${desktop}.nix")
    ./desktop/gtk.nix
    ./desktop/fonts.nix
    ./programs/zsh.nix
    ./programs/fastfetch.nix
    ./programs/cli.nix
    ./programs/dev.nix
    ./programs/git.nix
    ./programs/firefox.nix
    ./programs/ghostty.nix
    ./programs/opencode.nix
    ./programs/vscodium.nix
    ./apps/apps.nix
    ./apps/webapps.nix
  ];
}
