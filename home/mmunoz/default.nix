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
    ./programs/fastfetch
    ./programs/cli.nix
    ./programs/dev.nix
    ./programs/git.nix
    ./programs/firefox.nix
    ./programs/ghostty.nix
    ./programs/opencode
    ./programs/vscodium.nix
    ./programs/neovim.nix
    ./apps/apps.nix
  ];
}
