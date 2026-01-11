{ config, pkgs, ... }:
{
  hardware = {
    bluetooth.enable = false;
    bluetooth.powerOnBoot = false;
  };
  services = {
    auto-cpufreq.enable = true;
    power-profiles-daemon.enable = false;
  };
}
