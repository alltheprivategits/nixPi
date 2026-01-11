{ osConfig, ... }:
{
  programs.nh = {
    enable = osConfig.nh.enable;
    flake = "/etc/nixos";
  };
}
