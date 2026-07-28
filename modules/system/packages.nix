{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    lavat
  ];
}
