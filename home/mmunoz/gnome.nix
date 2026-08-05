{ pkgs, ... }: {
  home.packages = with pkgs; [
    gnome-boxes
    gnome-tweaks
  ];

  programs.gnome-shell = {
    enable = true;
    extensions = [
      { package = pkgs.gnomeExtensions.user-themes; }
      { package = pkgs.gnomeExtensions.blur-my-shell; }
      { package = pkgs.gnomeExtensions.clipboard-indicator; }
      { package = pkgs.gnomeExtensions.caffeine; }
      { package = pkgs.gnomeExtensions.tiling-shell; }
    ];
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      monospace-font-name = "JetBrainsMono Nerd Font 12";
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>e";
      command = "nautilus -w";
      name = "Open Nautilus";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>t";
      command = "ghostty";
      name = "Open Terminal";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Super>period";
      command = "gnome-characters";
      name = "Open Characters";
    };

    "org/gnome/shell/extensions/clipboard-indicator" = {
      toggle-menu = [ "<Super>v" ];
    };

    "org/gnome/desktop/wm/keybindings" = builtins.listToAttrs (
      map (i: {
        name = "switch-to-workspace-${toString (i + 1)}";
        value = [ "<Super>${toString (i + 1)}" ];
      }) (builtins.genList (i: i) 9)
    );

    "org/gnome/shell/keybindings" = {
      toggle-message-tray = [ ];
      show-screenshot-ui = [ "<Super><Shift>s" ];
      switch-to-application-1 = [ ];
      switch-to-application-2 = [ ];
      switch-to-application-3 = [ ];
      switch-to-application-4 = [ ];
      switch-to-application-5 = [ ];
      switch-to-application-6 = [ ];
      switch-to-application-7 = [ ];
      switch-to-application-8 = [ ];
      switch-to-application-9 = [ ];
    };
  };
}
