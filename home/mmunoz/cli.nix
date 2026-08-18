{ pkgs, pkgs-unstable, ... }: {
  home.packages =
    with pkgs;
    [
      mcp-nixos
      tree
      wget
      television
      nixfmt
      distrobox
    ]
    ++ (with pkgs-unstable; [
      antigravity-cli
    ]);

  programs.bat = {
    enable = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      update_interval = 0; # Only updates on focus/resize to save CPU
      vim_keys = true;
    };
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        charset = "utf-8";
        end_of_line = "lf";
        insert_final_newline = true;
        trim_trailing_whitespace = true;
        indent_style = "space";
        indent_size = 2;
      };
      "*.md" = {
        trim_trailing_whitespace = false;
      };
      "Makefile" = {
        indent_style = "tab";
      };
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
