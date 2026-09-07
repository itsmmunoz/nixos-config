{
  ...
}:
{
  programs.opencode = {
    enable = true;
    commands = ./commands;
    settings = {
      "$schema" = "https://opencode.ai/config.json";
      plugin = [ "@dietrichgebert/ponytail" ];
      mcp = {
        nixos = {
          type = "local";
          command = [ "mcp-nixos" ];
        };
      };
    };
  };
}
