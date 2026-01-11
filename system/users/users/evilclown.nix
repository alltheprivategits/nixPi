{ lib, config, pkgs, ... }:
{
  options.evilclown.syncapikey = lib.mkOption {
    type = lib.types.str;
  };
  config = {
    users.users = {
      evilclown = {
        isNormalUser = true;
        description = "EvilClown";
        extraGroups = [ "networkmanager" "wheel" ];
        initialPassword = "password";
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPXjic2xJNcOSz4OBYhsi030ujudgaffkpgasRIWG8UH NewKey"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJR5Ygkpot9HEFWtcI/MKX6fn4xGb1dSY15Wts+5eWo/ new"
        ];
        shell = lib.mkIf config.zsh.enable pkgs.zsh;
      };
    };
  };
}
