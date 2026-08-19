{
  pkgs,
  inputs,
  ...
}:
{
  programs.firefox = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFirefoxScreenshots = true;
      DisableSetDesktopBackground = true;
      ExtensionSettings =
        let
          moz = id: "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";
        in
        {
          "{b5dd2040-96f6-4dc2-9a6e-58ea535eb175}" = {
            install_url = moz "google-translate";
            installation_mode = "normal_installed";
          };
          "{e369192d-43df-486e-aca0-d771eaed541d}" = {
            install_url = moz "firefox-hackbar";
            installation_mode = "force_installed";
          };
          "rexxargupta@gmail.com" = {
            install_url = moz "trufflehog";
            installation_mode = "force_installed";
          };
          "wappalyzer@crunchlabz.com" = {
            install_url = moz "wappalyzer";
            installation_mode = "force_installed";
          };
        };
    };

    profiles.default = {
      id = 0;
      isDefault = true;

      extensions = {
        packages = with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
          foxyproxy-standard
          cookie-editor
        ];
        force = true;
        settings = {
          "uBlock0@raymondhill.net".settings = {
            selectedFilterLists = [
              "ublock-filters"
              "ublock-privacy"
              "ublock-unbreak"
              "ublock-badware"
            ];
          };
        };
      };

      search = {
        force = true;
        default = "google";
        privateDefault = "ddg";
        engines = {
          "ddg".metaData.alias = "@ddg";
          "google".metaData.alias = "@g";
          "Nix Packages" = {
            name = "Nix Packages";
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
        };
      };

      bookmarks = {
        force = true;
        settings = [
          {
            name = "NixOS";
            url = "https://nixos.org";
          }
          {
            name = "NixOS Wiki";
            url = "https://wiki.nixos.org/";
          }
          "separator"
          {
            name = "GitHub";
            bookmarks = [
              {
                name = "mi perfil";
                url = "https://github.com/maycolmunoz";
              }
            ];
          }
        ];
      };

      settings = {
        "browser.startup.homepage" = "about:blank";
        "browser.search.separatePrivateDefault" = false;
        "browser.toolbars.bookmarks.visibility" = "always";
        "browser.sessionstore.resume_session_once" = true;
        "privacy.donottrackheader.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "network.cookie.cookieBehavior" = 5;
        "dom.security.https_only_mode" = true;
        "extensions.autoDisableScopes" = 0;
      };
    };
  };
}
