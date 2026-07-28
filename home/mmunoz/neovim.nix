{
  programs.lazyvim = {
    enable = true;
    extras = {
      lang.php.enable = true;
      lang.typescript.enable = true;
      lang.nix.enable = true;
      formatting.prettier.enable = true;
      linting.eslint.enable = true;
    };
  };
}
