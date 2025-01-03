{ pkgs, config, ... }:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home.packages = with pkgs; [
    firefox
    kitty
    tree
    arandr
    vscode
    nixfmt-rfc-style
    nixd
  ];

  programs.git = {
    enable = true;
    userName = "Luís Duarte";
    userEmail = "luis.duarte.2003.13@hotmail.com";
  };

  home.sessionVariables = {
    EDITOR = "vim";
    TERMINAL = "kitty";
  };

  # enable bash in order for home-manager to change session variables
  programs.bash.enable = true;

  home.stateVersion = "24.11";

  # Copy scripts folder to `~/.local/bin` and add it to path
  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];
  home.file = {
    ".local/bin" = {
      source = ./scripts;
      recursive = true;
    };
  };
}
