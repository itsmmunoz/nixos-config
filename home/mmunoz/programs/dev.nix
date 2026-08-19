{ pkgs, ... }:

{
  home.packages = with pkgs; [
    php84Packages.composer

    nodejs_24
    pnpm
    yarn

    lazydocker
    lazygit
    lazysql
  ];
}
