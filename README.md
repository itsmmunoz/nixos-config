# nixos-config

NixOS flake configuration for host `nixos` (x86_64-linux).

## Structure

```
├── config.nix                — single source of truth (user, host, features, flags)
├── flake.nix
├── home-manager.nix          — home-manager module config
├── hosts/nixos/              — host-specific (default.nix, hardware.nix)
├── home/mmunoz/              — home-manager (zsh, git, gtk, ghostty, firefox, cli,
│                               opencode, fastfetch, dev, webapps, fonts, gnome)
└── modules/
    ├── default.nix           — central importer (uses feature flags)
    ├── desktop/
    │   └── gnome/            — gnome (default.nix, packages.nix, xserver.nix)
    ├── services/             — pipewire, flatpak, virtualisation, printing, fwupd, localsend
    └── system/               — locale, nix-settings, packages, users, boot
```

## Usage

```bash
# Rebuild
update

# Update inputs
nix flake update && update

# Garbage collect (automatic: weekly, >14 days)
cleanup
```

## Notable packages

| Source | Packages |
|--------|----------|
| home (stable) | tree, wget, fastfetch, corefonts, lazygit, lazysql, obsidian, obs-studio, onlyoffice, nixfmt, lavat, television, cava, cowsay, hollywood, asciiquarium, pipes, composer, fnm, nodejs_24, pnpm, yarn, gnome-boxes, gnome-tweaks, mcp-nixos |
| home (unstable) | vscode, brave, opencode, antigravity-cli |
| hm modules | bat, btop, yazi, firefox, ghostty, git |

## Development

- **PHP:** composer
- **Node.js:** fnm, nodejs_24, pnpm, yarn
- **Tools:** lazygit, lazysql

## GNOME configuration

- **Extensions:** user-themes, clipboard-indicator, caffeine, tiling-shell
- **Keybindings:** Super+E (files), Super+T (terminal), Super+V (clipboard), Super+1-9 (workspaces)

## Web apps

Desktop entries via `brave --app`:
- WhatsApp, ChatGPT, Clipchamp

## Services

- GNOME (GDM) desktop
- PipeWire (audio, ALSA + PulseAudio compat)
- CUPS (printing, IPP-USB)
- Flatpak
- Virtualisation (Docker + libvirtd + Spice USB)
- fwupd
- LocalSend

## System

- **State version:** 26.05
- **Boot:** systemd-boot (EFI)
- **Filesystem:** Btrfs (subvolumes /, /home, /nix)
- **Host:** QEMU/KVM guest
- **Locale:** en_US.UTF-8 / es_CO.UTF-8 (Colombia)
- **Timezone:** America/Bogota
- **Shell:** Zsh (oh-my-zsh, agnoster)
