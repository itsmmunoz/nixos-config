{ pkgs, ... }: {
  imports = [ ./xserver.nix ];

  environment.gnome.excludePackages = with pkgs; [
    gnome-software
    gnome-tour
    gnome-weather
    gnome-clocks
    gnome-calendar
    gnome-contacts
    gnome-maps
    epiphany
    yelp
  ];

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  programs.dconf.enable = true;
}
