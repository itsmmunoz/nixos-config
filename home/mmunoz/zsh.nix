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
        "copypath"
        "copyfile"
        "web-search"
      ];
    };

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      test = "sudo nixos-rebuild test --flake /etc/nixos#nixos";
      diff = "nixos-rebuild dry-activate --flake /etc/nixos#nixos";
      nix-gc = "sudo nix-collect-garbage -d";
      nix-history = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      nix-edit = "code /etc/nixos";
      nix-update = "nix flake update /etc/nixos && update";
      search = "nix search nixpkgs";
      fmt = "nix fmt /etc/nixos";
    };

    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
      ignoreDups = true;
      share = true;
    };

    initContent = ''
      setopt APPEND_HISTORY
      setopt SHARE_HISTORY

      # Arrow key history search (after oh-my-zsh init)
      bindkey '^[[A' history-search-backward
      bindkey '^[[B' history-search-forward
    '';
  };
}
