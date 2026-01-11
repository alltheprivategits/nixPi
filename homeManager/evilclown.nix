{ pkgs, ... }:
{
  programs = {
    home-manager.enable = true;
    git.settings.user = {
      Name = "alltheprivategits";
      Email = "allthegits@proton.me";
      safe = {
	directoriy = "/etc/nixos";
      };
      # Name = "spencer alleen";
      # userName  = "SaggingLeftNut";
      # userEmail = "mrspencerallen@gmail.com";
      # Name = "ntemacs guy"
      # userName  = "ntemacsguy";
      # userEmail = "ntemacsguy@proton.me";
    };
  };
  home = {
    username = "evilclown";
    homeDirectory = "/home/evilclown";
    stateVersion = "25.11";
    packages = with pkgs; [
      # provides notify-send needed for testing dunst
    ];
    sessionVariables = rec {
      PATH = "$PATH:/home/evilclown/.local/bin";
    };
  };
  imports =
    [
      ./modules/git.nix
      ./modules/zsh.nix
      ./modules/starship.nix
      ./modules/btop.nix
      ./modules/bat.nix
      ./modules/xdgDirs.nix
      ./modules/nh.nix
    ];
}
