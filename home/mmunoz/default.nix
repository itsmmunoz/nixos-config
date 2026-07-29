{ desktop, hostConfig, ... }: {
  home.username = hostConfig.username;
  home.homeDirectory = "/home/${hostConfig.username}";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  imports = [
    (./. + "/${desktop}.nix")
    ./gtk.nix
    ./zsh.nix
    ./fastfetch.nix
    ./cli.nix
    ./dev.nix
    ./git.nix
    ./firefox.nix
    ./ghostty.nix
    ./opencode.nix
    ./neovim.nix
    ./apps.nix
    ./webapps.nix
    ./fonts.nix
  ];
}
