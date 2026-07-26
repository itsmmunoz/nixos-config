# NixOS flake config — /etc/nixos

## Build & apply

```bash
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

Home-manager is integrated as a NixOS module (not standalone). Changes to `home/mmunoz/` apply via the same command.

## Structure

| Path | Purpose |
|------|---------|
| `flake.nix` | Entry point; pins nixpkgs (26.05) + home-manager (release-26.05) + nixpkgs-unstable |
| `home-manager.nix` | Home-manager module configuration (useGlobalPkgs, user imports) |
| `hosts/nixos/default.nix` | Host config; imports `modules/` + hardware.nix |
| `hosts/nixos/hardware.nix` | Auto-generated, do not edit |
| `home/mmunoz/` | Home-manager: zsh, git, gnome (dconf + gtk), cli tools (bat, btop, yazi, editorconfig, direnv), firefox, ghostty, opencode |
| `modules/desktop/` | Desktop selection (`default.nix`) + per-desktop dirs (`gnome/`) with system configs |
| `modules/services/` | pipewire, printing, flatpak, fwupd, virtualisation (docker, libvirtd), localsend |
| `modules/system/` | boot, locale, nix-settings, packages (stable + unstable), users |

## Notable patterns

- **Desktop selection**: `modules/desktop/default.nix` imports the active desktop. To switch desktops, change the import there and in `home/mmunoz/default.nix`.
- **Desktop structure**: Each desktop has its own dir under `modules/desktop/` with `default.nix` (system) and its home-manager config in `home/mmunoz/{name}.nix`.
- **Unstable packages**: Defined once in `flake.nix` as `pkgs-unstable` and passed via `specialArgs`. Add new unstable pkgs in `modules/system/packages.nix` by extending the `pkgs-unstable` set.
- **New modules**: add to `modules/default.nix` imports. New home modules add to `home/mmunoz/default.nix` imports.
- **Home-manager CLI tools**: User CLI tools with Home Manager modules (bat, btop, yazi, editorconfig, direnv) are in `home/mmunoz/cli.nix`.

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
- User tools with Home Manager modules go in `home/mmunoz/cli.nix`.
- Commit via conventional commits: `feat|fix|refactor|chore(scope): message`.
