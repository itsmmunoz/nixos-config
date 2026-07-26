{ ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git"
        "sudo"
        "docker"
        "npm"
        "node"
        "extract"
        "z"
      ];
    };

    shellAliases = {
      ll = "ls -lah";
      la = "ls -A";
      l = "ls -CF";
      update = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      cleanup = "sudo nix-collect-garbage -d";
      nixos-history = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      nix-edit = "code /etc/nixos";
      nix-gc = "sudo nix-collect-garbage --delete-older-than 14d";
      nix-update = "nix flake update /etc/nixos && update";
    };

    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
      ignoreDups = true;
      share = true;
    };

    initContent = ''
      format-nix() {
        nixfmt $(find /etc/nixos -name '*.nix' -not -path '*/result/*' -not -path '*/.git/*')
      }

      # Arrow key history search (after oh-my-zsh init)
      bindkey '^[[A' history-search-backward
      bindkey '^[[B' history-search-forward
    '';
  };
}
