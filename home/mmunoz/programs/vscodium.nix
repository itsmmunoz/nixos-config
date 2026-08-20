{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  programs.vscodium = {
    enable = true;
    package = pkgs-unstable.vscodium;

    profiles.default.extensions =
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
}
