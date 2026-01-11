{ config, pkgs, lib, ... }:
{
  options = {
    git.enable = lib.mkEnableOption "Enables git";
  };
  config = lib.mkIf config.git.enable {
    environment.systemPackages = with pkgs; [
      git
      git-lfs
    ];
  };
}
