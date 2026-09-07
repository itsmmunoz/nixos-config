{
  ...
}:
{
  programs.antigravity-cli = {
    enable = true;
    skills = ./skills;
    mcpServers = {
      nixos = {
        command = [ "mcp-nixos" ];
      };
    };
  };
}
