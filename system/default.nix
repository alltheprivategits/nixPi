{ config, lib, ... }:
{
  imports =
    [
      ./core/default.nix
      ./users/default.nix
      ./utils/default.nix
      ./commandLineApps/default.nix
      # ./gui/default.nix
      # ./desktopApps/default.nix
      # ./specialisations/mobile.nix
    ];
  # config = {
    systemUtils.enable = lib.mkDefault true;
    commandLineApps.enable = lib.mkDefault true;
  #   gui.enable = lib.mkDefault true;
  #   desktopApps.enable = config.gui.enable;
  # };
}
