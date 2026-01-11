{ config, lib, ... }:
{
  imports =
    [
      ./modules/piHole.nix
      # ./modules/avahi.nix
    ];
  options = {
    services.enable = lib.mkEnableOption "Enables all the linux system services";
  };
  config = lib.mkIf config.systemUtils.enable {
    pihole.enable = lib.mkDefault true;
    # avahi.enable = lib.mkDefault true;
  };
}
