{ config, pkgs, ... }:
{
  # Allow unfree packages (try to keep it gpl)
  nixpkgs.config.allowUnfree = false;
  # inital system state
  system.stateVersion = "25.11";
  nix = {
    # home-manager
    package = pkgs.nixVersions.latest;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    # garbage collection
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 5d";
    };
    settings.auto-optimise-store = true;
  };
  environment.sessionVariables = {
    FLAKE = "/etc/nixos";
  };
}
