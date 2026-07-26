{ hostConfig, ... }: {
  services.xserver = {
    enable = true;
    xkb = {
      layout = hostConfig.xkbLayout;
      variant = "";
    };
  };
}
