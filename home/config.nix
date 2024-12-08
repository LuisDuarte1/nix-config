{pkgs, config, ...}: {

    # nixpkgs.config.allowUnfreePredicate = pkg:
    #   builtins.elem (lib.getName pkg) [
    #     # use unfree vscode version because it's better than vscodium - proprietary extentons
	  #     "vscode"
    # ];  

    
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    home.packages = with pkgs;  [
      firefox
      kitty
      tree
      arandr
      vscode
      nixfmt-rfc-style
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