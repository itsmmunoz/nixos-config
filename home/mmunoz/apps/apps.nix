{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    obsidian
    obs-studio
    onlyoffice-desktopeditors
    brave
    handy
  ];
}
