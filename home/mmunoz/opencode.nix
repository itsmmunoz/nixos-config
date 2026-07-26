{ ... }: {
  xdg.configFile."opencode/opencode.json".text = ''
    {
      "$schema": "https://opencode.ai/config.json",
      "plugin": ["@dietrichgebert/ponytail"],
      "mcp": {
        "nixos": {
          "type": "local",
          "command": ["mcp-nixos"]
        }
      }
    }
  '';
}
