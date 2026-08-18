{ pkgs, lib, ... }: {
  home.packages = [ pkgs.corefonts ];

  home.activation.fontLinks = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.local/share/fonts"

    cp -f ${pkgs.corefonts}/share/fonts/truetype/*.ttf \
      "$HOME/.local/share/fonts/"

    ${pkgs.fontconfig}/bin/fc-cache -f
  '';
}
