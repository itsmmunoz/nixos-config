{ hostConfig, ... }: {
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
        "fnm"
        "composer"
        "extract"
        "z"
        "copypath"
        "copyfile"
        "web-search"
      ];
    };

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ${hostConfig.flakePath}#${hostConfig.flakeConfig}";
      test = "sudo nixos-rebuild test --flake ${hostConfig.flakePath}#${hostConfig.flakeConfig}";
      diff = "nixos-rebuild dry-activate --flake ${hostConfig.flakePath}#${hostConfig.flakeConfig}";
      nix-gc = "sudo nix-collect-garbage -d";
      nix-history = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      nix-edit = "code ${hostConfig.flakePath}";
      nix-update = "nix flake update ${hostConfig.flakePath} && update";
      sail = "[ -f sail ] && sh sail || sh vendor/bin/sail";
      search = "nix search nixpkgs";
      fmt = "nix fmt ${hostConfig.flakePath}";
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

      # fnm (Fast Node Manager) — auto-switch Node version
      eval "$(fnm env --use-on-cd)"

      # Arrow key history search (after oh-my-zsh init)
      bindkey '^[[A' history-search-backward
      bindkey '^[[B' history-search-forward
    '';
  };
}
