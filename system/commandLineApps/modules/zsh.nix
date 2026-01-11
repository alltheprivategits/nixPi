{ config, pkgs, lib, ... }:
{
  options = {
    zsh.enable = lib.mkEnableOption "Enables zsh";
  };
  config = lib.mkIf config.zsh.enable {
    programs.zsh.enable = true;
  };
}
