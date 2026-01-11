{ config, lib, pkgs, ... }:
{
  options = {
    hostname = lib.mkOption {
      type = lib.types.str;
    };
  };
  config = {
    networking = {
      firewall = {
        # enable = true;
      }; 
      hostName = config.hostname;
      networkmanager.enable = true;
      # nftables.enable = true;
    };
    # services.resolved = {
    #   enable = true;
    #   fallbackDns = ["192.168.1.1"];
    # };
  };
}
