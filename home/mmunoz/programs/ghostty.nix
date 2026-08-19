{ pkgs, ... }: {
  home.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installVimSyntax = true;

    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-size = 13;

      window-padding-x = 4;
      window-padding-y = 4;
      background-opacity = 0.92;
      background-blur-radius = 20;

      cursor-style = "block";
      cursor-style-blink = true;
      mouse-hide-while-typing = true;

      copy-on-select = "clipboard";
      clipboard-paste-protection = false;

      scrollback-limit = 50000;
      confirm-close-surface = false;
      quit-after-last-window-closed = true;

      keybind = [
        "ctrl+shift+t=new_tab"
        "ctrl+shift+left=previous_tab"
        "ctrl+shift+right=next_tab"
        "ctrl+shift+n=new_window"
        "ctrl+shift+enter=toggle_fullscreen"
      ];
    };
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "com.mitchellh.ghostty.desktop" ];
      GNOME = [ "com.mitchellh.ghostty.desktop" ];
    };
  };
}
