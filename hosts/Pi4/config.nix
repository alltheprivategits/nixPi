{ config, host, lib, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../../default.nix
    ];
  config = {
    hostname = "${host}";
  };
}
