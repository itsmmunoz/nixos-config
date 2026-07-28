{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    corefonts
    lavat
  ];
}
