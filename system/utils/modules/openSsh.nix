{ config, pkgs, lib, ... }:
{
  options = {
    openSsh.enable = lib.mkEnableOption "Enables openSsh";
  };
  config = lib.mkIf config.openSsh.enable {
    services = {
      openssh = {
        enable = true;
        ports = [1752];
        openFirewall = true;
        settings = {
          PasswordAuthentication = false;
          PermitRootLogin = "no";
          AllowGroups = ["wheel"];
          UseDns = true;
          AllowTcpForwarding = "no";
          ClientAliveCountMax = 2;
          MaxAuthTries = 3;
          MaxSessions = 2;
          TCPKeepAlive = "no";
          AllowAgentForwarding = "no";
        };
      };
      fail2ban.enable = true;
    };
  };
}
