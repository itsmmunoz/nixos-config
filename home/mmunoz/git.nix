{ hostConfig, ... }: {
  programs.git = {
    enable = true;
    settings = {
      user.name = hostConfig.gitUsername;
      user.email = hostConfig.email;
      init.defaultBranch = "main";
    };
  };
}
