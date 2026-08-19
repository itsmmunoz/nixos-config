{ pkgs, pkgs-unstable, ... }:

let
  brave = "${pkgs-unstable.brave}/bin/brave";
  icons = {
    clipchamp = builtins.fetchurl {
      url = "https://clipchamp.com/icon1.png";
      name = "clipchamp.png";
      sha256 = "1nag0390kxn5vadx06w5r5wp9hc9d18ak6pxbxi2dlw3qphqk2dw";
    };
  };
in
{
  xdg.desktopEntries = {
    clipchamp = {
      name = "Clipchamp";
      exec = "${brave} --app=https://app.clipchamp.com/consumer/home";
      icon = icons.clipchamp;
      categories = [ "AudioVideo" ];
      terminal = false;
    };
  };
}
