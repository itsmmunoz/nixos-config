{ pkgs, ... }: {
  home.packages = with pkgs; [ fastfetch ];

  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
        "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
        "logo": {
            "type": "builtin",
            "height": 15,
            "width": 4,
            "padding": {
                "top": 3,
                "left": 3
            }
        },
        "modules": [
            "break",
            {
                "type": "host",
                "key": "  Host",
                "keyColor": "yellow"
            },
            {
                "type": "custom",
                "format": "\u001b[90m┌────────────────────── Software ──────────────────────┐"
            },
            {
                "type": "os",
                "key": "  Distro",
                "keyColor": "yellow"
            },
            {
                "type": "kernel",
                "key": "  Kernel",
                "keyColor": "yellow"
            },
            {
                "type": "packages",
                "key": "  Packages",
                "keyColor": "yellow"
            },
            {
                "type": "terminal",
                "key": "  Terminal",
                "keyColor": "yellow"
            },
            {
                "type": "shell",
                "key": "  Shell",
                "keyColor": "yellow"
            },
            {
                "type": "de",
                "key": "  DE",
                "keyColor": "yellow"
            },
            {
                "type": "lm",
                "key": "  LM",
                "keyColor": "yellow"
            },
            {
                "type": "wm",
                "key": "  WM",
                "keyColor": "yellow"
            },
            {
                "type": "vulkan",
                "key": "  Vulkan",
                "keyColor": "yellow"
            },
            {
                "type": "gpu",
                "key": " {#yellow} Driver",
                "format": "{driver}"
            },
            {
                "type": "bios",
                "key": "  BIOS",
                "keyColor": "yellow"
            },
            {
                "type": "custom",
                "format": "\u001b[90m└──────────────────────────────────────────────────────┘"
            },
            "break",
            {
                "type": "custom",
                "format": "\u001b[90m┌────────────────────── Hardware ──────────────────────┐"
            },
            {
                "type": "board",
                "key": "  Mainboard",
                "keyColor": "green"
            },
            {
                "type": "cpu",
                "key": "  CPU",
                "keyColor": "green"
            },
            {
                "type": "gpu",
                "key": "  GPU",
                "keyColor": "green"
            },
            {
                "type": "memory",
                "key": "  RAM",
                "keyColor": "green"
            },
            {
                "type": "swap",
                "key": "  Swap",
                "keyColor": "green"
            },
            {
                "type": "disk",
                "key": "  Disk",
                "keyColor": "green"
            },
            {
                "type": "localip",
                "key": "  IP",
                "keyColor": "green"
            },
            {
                "type": "custom",
                "format": "\u001b[90m└──────────────────────────────────────────────────────┘"
            },
            "break",
            {
                "type": "custom",
                "format": "\u001b[90m┌──────────────────── Age / Uptime ────────────────────┐"
            },
            {
                "type": "disk",
                "key": "  OS Age",
                "keyColor": "blue",
                "folders": "/",
                "format": "{create-time:10} ({days} days)"
            },
            {
                "type": "uptime",
                "key": "  Uptime",
                "keyColor": "blue"
            },
            {
                "type": "custom",
                "format": "\u001b[90m└──────────────────────────────────────────────────────┘"
            }
        ]
    }
  '';
}
