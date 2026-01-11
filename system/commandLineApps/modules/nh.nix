{ config, pkgs, lib, ... }:
{
  options = {
    nh.enable = lib.mkEnableOption "Enables nh";
  };
  config = lib.mkIf config.nh.enable {
    environment.systemPackages = with pkgs; [
      nh
    ];
  };
}
