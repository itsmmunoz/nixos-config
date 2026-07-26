{
  inputs,
  pkgs-unstable,
  desktop,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs pkgs-unstable desktop; };
    backupFileExtension = "hm-backup";
    users.mmunoz = import ./home/mmunoz;
  };
}
