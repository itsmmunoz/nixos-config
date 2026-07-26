{
  # User identity
  username = "mmunoz";
  fullName = "Maycol Muñoz";
  email = "estivenyeizon@gmail.com";
  gitUsername = "maycolmunoz";

  # System
  hostname = "nixos";
  timezone = "America/Bogota";
  locale = "es_CO.UTF-8";
  consoleKeyMap = "la-latin1";
  xkbLayout = "latam";

  # Flake path (used in zsh aliases)
  flakePath = "/etc/nixos";
  flakeConfig = "nixos";

  # Feature flags per host
  features = {
    virtualisation = true;
    printing = true;
    flatpak = true;
    fwupd = true;
    localsend = true;
  };
}
