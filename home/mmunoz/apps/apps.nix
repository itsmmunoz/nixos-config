{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  home.packages =
    with pkgs;
    [
      obsidian
      obs-studio
      onlyoffice-desktopeditors
    ]
    ++ (with pkgs-unstable; [
      brave
    ]);
}
