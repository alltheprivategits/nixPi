{ config, lib, ... }:
{
  imports =
    [
      ./modules/locale.nix
      ./modules/nixSettings.nix
      ./modules/bootloader.nix
      ./modules/security.nix
      ./modules/hardwareOptions.nix
      ./modules/networking.nix
    ];
}
