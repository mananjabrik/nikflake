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
  home.username = "mananjabrik";
  home.homeDirectory = "/home/mananjabrik";
  
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
  
  home.packages = with pkgs; [
    slack
    spotify
    fzf
  ];

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "mananjabrik";
    userEmail = "manan.jabrik@gmail.com";
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
