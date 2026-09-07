{
  pkgs,
  ...
}:
{
  programs.vscodium = {
    enable = true;

    profiles.default = {
      userSettings = {
        # Theme & UI
        "workbench.colorTheme" = "Ayu Mirage";
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.startupEditor" = "none";
        "workbench.activityBar.location" = "top";
        "window.titleBarStyle" = "custom";
        "update.mode" = "none";

        # Editor
        "editor.fontSize" = 14;
        "editor.fontFamily" = "monospace";
        "editor.tabSize" = 2;
        "editor.minimap.enabled" = false;
        "editor.formatOnSave" = true;
        "editor.suggestSelection" = "first";
        "editor.codeActionsOnSave" = {
          "source.fixAll.eslint" = "explicit";
        };

        # Prettier
        "prettier.singleQuote" = true;
        "prettier.semicolon" = false;

        # Per-language Prettier formatting
        "[javascript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[vue]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[json]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[css]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[html]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };

        # ESLint
        "eslint.validate" = [
          "javascript"
          "typescript"
          "vue"
        ];

        # PHP
        "php.validate.executablePath" = "${pkgs.php}/bin/php";
        "intelephense.environment.phpVersion" = "8.4";

        # Files
        "files.autoSave" = "afterDelay";
        "files.insertFinalNewline" = true;
        "files.trimTrailingWhitespace" = true;

        # Terminal
        "terminal.integrated.defaultProfile.linux" = "zsh";
        "workbench.panel.defaultLocation" = "right";
      };

      extensions =
        with pkgs.vscode-extensions;
        [
          teabyii.ayu
          dbaeumer.vscode-eslint
          pkief.material-icon-theme
          bmewburn.vscode-intelephense-client
          esbenp.prettier-vscode
          bradlc.vscode-tailwindcss
          vue.volar
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "vscode-laravel";
            publisher = "laravel";
            version = "2.0.0";
            sha256 = "0rd8s6mmvmv4gzzgn8skdjswh2gb3y8whyy9hkz3xgjsfjv0845l";
          }
          {
            name = "vscode-thunder-client";
            publisher = "rangav";
            version = "2.41.1";
            sha256 = "066a7fdiwrxhfn20g132h215l4s5ixf0vah3q5srpd5djb7pkd04";
          }
        ];
    };
  };
}
