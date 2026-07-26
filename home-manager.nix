{
  inputs,
  hostConfig,
  pkgs-unstable,
  desktop,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs pkgs-unstable desktop;
      inherit hostConfig;
    };
    backupFileExtension = "hm-backup";
    users.${hostConfig.username} = import ./home/mmunoz;
  };
}
