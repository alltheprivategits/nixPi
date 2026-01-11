{ config, lib, ... }:
{
  imports =
    [
      ./modules/piHole.nix
      ./modules/unbound.nix
    ];
  options = {
    services.enable = lib.mkEnableOption "Enables all the linux system services";
  };
  config = lib.mkIf config.systemUtils.enable {
    pihole.enable = lib.mkDefault true;
    unbound.enable = lib.mkDefault true;
  };
}
