{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  environment.systemPackages =
    with pkgs;
    [
      tree
      wget
      fastfetch
      corefonts
      lazygit
      obsidian
      obs-studio
      onlyoffice-desktopeditors
      nixfmt
      mcp-nixos
      lavat
      lazysql
      cava
      television
      sl
      cowsay
      hollywood
      asciiquarium
      pipes
    ]
    ++ (with pkgs-unstable; [
      vscode
      opencode
      brave
    ]);
}
