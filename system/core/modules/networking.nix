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
      domain = "local";
      dhcpcd.enable = false;
      interfaces.end0.ipv4.addresses = [{
        address = "192.168.1.2";
        prefixLength = 24;
      }];
      defaultGateway = "192.168.1.1";
      nameservers = [ "192.168.1.1" ];
      # nftables.enable = true;
    };
    # services.resolved = {
    #   enable = true;
    #   fallbackDns = ["192.168.1.1"];
    # };
  };
}
