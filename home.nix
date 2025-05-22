{ config, pkgs, ... }:

{
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "25.05";

  home.packages = [
    pkgs.git
    pkgs.gh
    pkgs._1password-cli
    pkgs.k9s
    pkgs.kubectl
    pkgs.talosctl
    pkgs.sops
    pkgs.zsh
    pkgs.starship
    pkgs.zsh-autocomplete
    pkgs.xdg-utils
    pkgs.podman
    pkgs.podman-compose
    pkgs.go-task
    pkgs.gnumake
    pkgs.go
  ];

  home.file = {};
  
  # This is to solve the issue with opening URLs in the browser, and fit read only filesystem issues
  home.sessionVariables = {
    XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    GIT_CONFIG_GLOBAL = "${config.home.homeDirectory}/.config/git/config";
  };

  programs.git = {
    enable = true;
    userName = "1Solon";
    userEmail = "Solonerus@gmail.com";
    extraConfig = {
      "protocol.https".allow = "always";
      "push".autoSetupRemote = true;
    };
  };

  # Add GitHub CLI configuration
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "https";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      switch = "home-manager switch --flake .#nixos";
      update = "sudo nixos-rebuild switch";
    };
  };

  programs.starship = {
    enable = true;
    settings = {};
  };

  programs.home-manager.enable = true;
}