{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  programs.vscodium = {
    enable = true;
    package = pkgs-unstable.vscodium;

    profiles.default = {
      userSettings = {
        # Theme & UI
        "workbench.colorTheme" = "Ayu Mirage";
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.startupEditor" = "none";
        "window.titleBarStyle" = "custom";
        "update.mode" = "none";

        # Editor
        "editor.fontSize" = 14;
        "editor.fontFamily" = "monospace";
        "editor.tabSize" = 2;
        "editor.minimap.enabled" = false;
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.bracketPairColorization.enabled" = true;
        "editor.suggestSelection" = "first";
        "editor.codeActionsOnSave" = {
          "source.fixAll.eslint" = "explicit";
        };

        # Prettier
        "prettier.singleQuote" = true;
        "prettier.semicolon" = false;

        # ESLint
        "eslint.validate" = [
          "javascript"
          "typescript"
          "vue"
        ];

        # PHP
        "php.validate.executablePath" = "${pkgs.php}/bin/php";
        "intelephense.environment.phpVersion" = "8.4";

        # Vue
        "volar.enable" = true;
        "[vue]" = {
          "editor.defaultFormatter" = "Vue.volar";
        };

        # Files
        "files.autoSave" = "afterDelay";
        "files.exclude" = {
          "**/.git" = true;
          "**/node_modules" = true;
          "**/__pycache__" = true;
          "vendor/" = true;
          "storage/" = true;
          "bootstrap/cache" = true;
        };

        # Terminal
        "terminal.integrated.defaultProfile.linux" = "zsh";
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
