# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  environment,
  ...
}: {
  nixpkgs = {
    overlays = [
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  # copy zshrc to home
  home.file.".zshrc" = {
    source = ./zshrc;
  };
  
  home.packages = with pkgs; [
    # lsp
    lua-language-server
    nodePackages_latest.typescript-language-server
    gopls

    # compilers
    gcc
  ];

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "mananjabrik";
    userEmail = "manan.jabrik@gmail.com";
  };

	program.zsh = {
		enable = true;
		ohMyZsh = {
    		enable = true;
   			plugins = [ "git" "thefuck" ];
			theme = "robbyrussell";
  		};
	};

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
