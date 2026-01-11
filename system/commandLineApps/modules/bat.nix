{ config, pkgs, lib, ... }:
{
  options = {
    bat.enable = lib.mkEnableOption "Enables bat";
  };
  config = lib.mkIf config.bat.enable {
    environment.systemPackages = with pkgs; [
      bat
    ];
  };
}
