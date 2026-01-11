{ config, lib, ... }:
{
  imports =
    [
      ./modules/git.nix
      # ./modules/fastFetch.nix
      # ./modules/htop.nix
      # ./modules/iotop.nix
      ./modules/bat.nix
      # ./modules/pbzip2.nix
      # ./modules/tree.nix
      # ./modules/ripGrep.nix
      ./modules/nh.nix
      # ./modules/nixOutputMonitor.nix
      # ./modules/nvd.nix
      ./modules/zsh.nix
      # ./modules/dust.nix
      # ./modules/atuin.nix
      # ./modules/clamav.nix
      # ./modules/apparmor.nix
      # ./modules/sbctl.nix
      # ./modules/lynis.nix
      # ./modules/sysstat.nix
    ];
  options = {
    commandLineApps.enable = lib.mkEnableOption "Enables all the command line utilites";
  };
  config = lib.mkIf config.commandLineApps.enable {
    # sysstat.enable = lib.mkDefault true;
    # lynis.enable = lib.mkDefault true;
    # sbctl.enable = lib.mkDefault true;
    # apparmor.enable = lib.mkDefault false;
    # clamav.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    # fastFetch.enable = lib.mkDefault true;
    # htop.enable = lib.mkDefault true;
    # iotop.enable = lib.mkDefault true;
    bat.enable = lib.mkDefault true;
    # pbzip2.enable = lib.mkDefault true;
    # tree.enable = lib.mkDefault true;
    # ripGrep.enable = lib.mkDefault true;
    nh.enable = lib.mkDefault true;
    # nixOutputMonitor.enable = lib.mkDefault true;
    # nvd.enable = lib.mkDefault true;
    zsh.enable = lib.mkDefault true;
    # dust.enable = lib.mkDefault true;
    # atuin.enable = lib.mkDefault true;
  };
}
