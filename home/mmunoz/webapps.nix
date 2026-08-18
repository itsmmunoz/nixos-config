{ pkgs, pkgs-unstable, ... }:

let
  brave = "${pkgs-unstable.brave}/bin/brave";
  icons = {
    whatsapp = builtins.fetchurl {
      url = "https://cdn.simpleicons.org/whatsapp";
      name = "whatsapp.svg";
      sha256 = "0vw1j6pbjs2j77gh3fnikgd1jfmdgcf5xir3k3h9wrry3w77w69y";
    };
    chatgpt = builtins.fetchurl {
      url = "https://chatgpt.com/cdn/assets/favicon-l4nq08hd.svg";
      name = "chatgpt.svg";
      sha256 = "1sqai8a2knrp7fz1hsvgjmwqv929rvqpzy3wj7iwzzics93f0bcg";
    };
    clipchamp = builtins.fetchurl {
      url = "https://clipchamp.com/icon1.png";
      name = "clipchamp.png";
      sha256 = "1nag0390kxn5vadx06w5r5wp9hc9d18ak6pxbxi2dlw3qphqk2dw";
    };
  };
in
{
  xdg.desktopEntries = {
    whatsapp = {
      name = "WhatsApp";
      exec = "${brave} --app=https://web.whatsapp.com";
      icon = icons.whatsapp;
      categories = [
        "Network"
        "InstantMessaging"
      ];
      terminal = false;
    };
    chatgpt = {
      name = "ChatGPT";
      exec = "${brave} --app=https://chatgpt.com";
      icon = icons.chatgpt;
      categories = [ "Network" ];
      terminal = false;
    };
    clipchamp = {
      name = "Clipchamp";
      exec = "${brave} --app=https://clipchamp.com";
      icon = icons.clipchamp;
      categories = [ "AudioVideo" ];
      terminal = false;
    };
  };
}
