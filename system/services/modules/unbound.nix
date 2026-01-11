{ config, pkgs, lib, ... }:
{
  options = {
    unbound.enable = lib.mkEnableOption "Enables unbound";
  };
  config = lib.mkIf config.unbound.enable {
    services.unbound = {
      enable = true;
      settings = {
        server = {
          verbosity = 0;
          # When only using Unbound as DNS, make sure to replace 127.0.0.1 with your ip address
          # When using Unbound in combination with pi-hole or Adguard, leave 127.0.0.1, and point Adguard to 127.0.0.1:PORT
          interface = [ "127.0.0.1" ];
          port = 5335;
          do-ip4 = "yes";
          do-udp = "yes";
          do-tcp = "yes";
          do-ip6 = "yes";
          prefer-ip6 = "no";
          harden-glue = "yes";
          harden-dnssec-stripped = "yes";
          use-caps-for-id = "no";
          edns-buffer-size = 1232;
          prefetch = "yes";
          num-threads = 1;
          so-rcvbuf = "1m";
          private-address = [
            "192.168.0.0/16"
            "192.168.1.1/24"
            "169.254.0.0/16"
            "172.16.0.0/12"
            "10.0.0.0/8"
            "fd00::/8"
            "fe80::/10"
            "192.0.2.0/24"
            "198.51.100.0/24"
            "203.0.113.0/24"
            "255.255.255.255/32"
            "2001:db8::/32"
          ];
        };
      };
    };
  };
}
