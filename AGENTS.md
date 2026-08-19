# NixOS flake config — /etc/nixos

## Build & apply

```bash
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

Home-manager is integrated as a NixOS module (not standalone). Changes to `home/mmunoz/` apply via the same command.

## Structure

| Path | Purpose |
|------|---------|
| `config.nix` | **Single source of truth**: username, email, hostname, locale, desktop, flake paths, feature flags |
| `flake.nix` | Entry point; imports `config.nix`, pins nixpkgs (26.05) + home-manager (release-26.05) + nixpkgs-unstable |
| `home-manager.nix` | Home-manager module configuration (useGlobalPkgs, user imports) |
| `hosts/nixos/default.nix` | Host config; imports `modules/` + hardware.nix |
| `hosts/nixos/hardware.nix` | Auto-generated, do not edit |
| `home/mmunoz/` | Home-manager, organized in folders: `programs/` (zsh, git, firefox, ghostty, opencode, fastfetch, cli, dev), `desktop/` (gnome, gtk, fonts, cosmic), `apps/` (gui apps, webapps) |
| `modules/desktop/` | Desktop selection (`default.nix`) + per-desktop dirs (`gnome/`) with system configs |
| `modules/services/` | pipewire, printing, flatpak, fwupd, virtualisation (docker, libvirtd), localsend |
| `modules/system/` | boot, locale, nix-settings, users; system packages live in `home/mmunoz/` |

## Notable patterns

- **Centralized config**: `config.nix` holds all user/system values (username, email, hostname, locale, desktop, feature flags). All modules consume these via `hostConfig` (passed through `specialArgs`).
- **Feature flags**: `config.nix` → `features.*` controls which services are imported in `modules/default.nix`. Toggle services per host without touching module files.
- **Desktop selection**: `modules/desktop/default.nix` imports the active desktop. To switch desktops, change the `desktop` value in `config.nix` and add the corresponding file under `home/mmunoz/desktop/`.
- **Desktop structure**: Each desktop has its own dir under `modules/desktop/` with `default.nix` (system) and its home-manager config in `home/mmunoz/desktop/{name}.nix`.
- **Unstable packages**: Defined once in `flake.nix` as `pkgs-unstable` and passed via `specialArgs`. Use it in any `home/mmunoz/*.nix` `home.packages` block (e.g. `with pkgs-unstable; [ foo ]`).
- **New modules**: add to `modules/default.nix` imports. New home modules add to `home/mmunoz/default.nix` imports.
- **Home-manager CLI tools**: User CLI tools with Home Manager modules (bat, btop, yazi, editorconfig, direnv) plus standalone CLI pkgs and terminal toys are in `home/mmunoz/programs/cli.nix`. GUI apps live in `home/mmunoz/apps/apps.nix`, dev tooling in `home/mmunoz/programs/dev.nix`.
- **Theme**: GTK/icon/cursor theme is set once in `home/mmunoz/desktop/gtk.nix`; `desktop/gnome.nix` dconf only sets desktop-specific keys.

## Commands

- `update` (alias in zsh.nix) → rebuild
- `nix fmt` — format all Nix files
- `nix flake update` — update all inputs
- `sudo nix-collect-garbage --delete-older-than 14d` — GC (runs automatically weekly)
- `cleanup` (alias in zsh.nix) → GC
- `result/` is gitignored

## Gotchas

- **New Nix files must be git-tracked** before rebuild: `git add <file>` — Nix refuses to evaluate untracked files.
- **File ownership**: Ensure `/etc/nixos` files are owned by your user, not root. If needed: `sudo chown -R $USER:users /etc/nixos/`

## Conventions

- All Nix files use `{ ... }: { }` style with trailing semicolons.
- One module per file under `modules/{desktop,services,system}/`.
- User tools with Home Manager modules go in `home/mmunoz/programs/cli.nix`.
- Commit via conventional commits: `feat|fix|refactor|chore(scope): message`.
