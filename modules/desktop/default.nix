{ desktop, ... }: {
  imports = [
    (./. + "/${desktop}/default.nix")
  ];
}
