{
  inputs,
  hostConfig,
  pkgs-unstable,
  desktop,
  lazyvim-nix,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [ lazyvim-nix.homeManagerModules.default ];
    extraSpecialArgs = {
      inherit inputs pkgs-unstable desktop;
      inherit hostConfig;
      inherit lazyvim-nix;
    };
    backupFileExtension = "hm-backup";
    users.${hostConfig.username} = import ./home/mmunoz;
  };
}
