{
  inputs,
  hostConfig,
  desktop,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs desktop;
      inherit hostConfig;
    };
    backupFileExtension = "hm-backup";
    users.${hostConfig.username} = import ./home/mmunoz;
  };
}
