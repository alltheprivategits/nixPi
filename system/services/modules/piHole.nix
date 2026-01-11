{ config, pkgs, lib, ... }:
{
  options = {
    pihole.enable = lib.mkEnableOption "Enables pihole";
  };
  config = lib.mkIf config.pihole.enable {
    networking.hosts = {
      "192.168.1.1" = ["gateway.local" "gateway"];
      "192.168.1.2" = ["Pi4.local" "Pi4"];
    };
    services = {
      dnsmasq = {
        enable = false;
        settings = {
          address = [
            "/feelinsonice-hrd.appspot.com/ # Block Snapchat"
            "/feelinsonice.appspot.com/ # Block Snapchat"
            "/snapchat.com/ # Block Snapchat"
          ];
          dhcp-name-match = [
            "set:hostname-ignore,wpad"
            "set:hostname-ignore,localhost"
          ];
          # Set DHCP option 6 to the DNS server you nodes should use.
          dhcp-option = [
            "vendor:MSFT,2,1i"
            "6,192.168.33.2"
          ];
          domain = [
            "local,192.168.33.0/24,local"
          ];
        };
      };
      pihole-ftl = {    
        enable = true;
        lists = [
          {
            url = "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts";
            type = "block";
            enabled = true;
            description = "Steven Black's HOSTS";
          }
        ];
        openFirewallDNS = true;
        openFirewallDHCP = true;
        openFirewallWebserver = true;
        queryLogDeleter.enable = true;
        privacyLevel = 3;
        settings = {
          dhcp = {
            active = false; # <-- SET TO TRUE ONLY WHEN YOU'RE READY!
            end = "192.168.1.254";
            hosts = [
              "00:00:5e:00:53:01,192.168.33.22,jane-laptop"
              "00:00:5e:00:53:ab,bill-desktop"
              "00:00:5e:00:53:ff,office-printer"
            ];
            ipv6 = false;
            leaseTime = "24h";
            start = "192.168.33.3";
            rapidCommit = true;
            resolver = {
              resolveIPv6 = false;
            };
            router = "192.168.1.1";
          };
          # misc.readOnly = false;
          dns = {
          cnameRecords = [
            "color-printer,office-printer"
            "color-printer.homelab.me,office-printer.homelab.me"
          ];
          domain = "local";
          domainNeeded = true;
          expandHosts = true;
          interface = "end0";
          hosts = [
            "192.168.1.1   gateway"
            "192.168.1.2   pi-hole"
            "192.168.1.3  nas"
          ];
          upstreams = ["127.0.0.1#5353"];
          };
          # Let's not use Pi-hole time service. My home router provides clock.
          ntp = {
            ipv4.active = false;
            ipv6.active = false;
            sync.active = false;
          };
          webserver = {
            api = {
            # To manage the web login:
            # 1) Temporarily set misc.readOnly to false in
            #    configuration.nix and switch to it.
            # 2) Manually set a password:
            #    Pi-hole web console > Settings > All settings >
            #    Webserver and API > webserver.api.password > Value: ******
            # 3) Read the generated hash:
            #    sudo pihole-FTL --config webserver.api.pwhash
              # pwhash = "$BALLOON-SHA256...";
              # misc.readOnly = false;
            };            
            session = {
              timeout = 43200; # 12h
            };
          };
        };
        useDnsmasqConfig = true;
      };
      pihole-web = {
        enable = true;
        ports = [80];
      };

      resolved = {
        extraConfig = ''
          DNSStubListener=no
          MulticastDNS=off
        '';
      };
    };
    #
    # System
    #
    system.activationScripts = {
      print-pi-hole = {
        text = builtins.trace "building the pi-hole configuration..." "";
      };
    };
  };
}
