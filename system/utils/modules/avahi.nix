{ config, pkgs, lib, ... }:
{
  options = {
    avahi.enable = lib.mkEnableOption "Enables avahi";
  };
  config = lib.mkIf config.avahi.enable {
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        domain = true;
        addresses = true;
      };
    };
  };
}
