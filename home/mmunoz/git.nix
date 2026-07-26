{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "maycolmunoz";
      user.email = "estivenyeizon@gmail.com";
      init.defaultBranch = "main";
    };
  };
}
