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
  ];

  home.file = {};
  home.sessionVariables = {};

  programs.git = {
    enable = true;
    userName = "1Solon";
    userEmail = "Solonerus@gmail.com";
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
