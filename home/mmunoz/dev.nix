{ pkgs, ... }:
let
  phpWithExtensions = pkgs.php.withExtensions (
    { all, ... }: with all;
    [
      pdo_mysql
      mbstring
      curl
      gd
      bcmath
      zip
      intl
      opcache
      exif
      sockets
    ]
  );
in
{
  home.packages = with pkgs; [
    phpWithExtensions
    php84Packages.composer
    fnm
    yarn
    pnpm
  ];
}
