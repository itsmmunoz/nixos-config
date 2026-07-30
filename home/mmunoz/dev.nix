{ pkgs, ... }:

{
  home.packages = with pkgs; [
    php84Packages.composer

    fnm
    nodejs_24

    pnpm
    yarn

    lazygit
    lazysql
  ];
}
