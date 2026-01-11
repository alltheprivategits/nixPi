{ config, lib, ... }:
{
  imports =
    [
      ./modules/openSsh.nix
    ];
  options = {
    systemUtils.enable = lib.mkEnableOption "Enables all the linux system utilites";
  };
  config = lib.mkIf config.systemUtils.enable {
    openSsh.enable = lib.mkDefault true;
  };
}
