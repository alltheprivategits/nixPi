{ config, lib, ... }:
{
  imports =
    [
      ./modules/openSsh.nix
      ./modules/avahi.nix
    ];
  options = {
    systemUtils.enable = lib.mkEnableOption "Enables all the linux system utilites";
  };
  config = lib.mkIf config.systemUtils.enable {
    openSsh.enable = lib.mkDefault true;
    avahi.enable = lib.mkDefault true;
  };
}
