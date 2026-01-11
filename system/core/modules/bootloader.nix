{ config, pkgs, ... }:
{
  boot = {
    loader = {
      # Use the extlinux boot loader. (For PPI 4b. NixOS wants to enable GRUB by default)
      grub.enable = false;
      # Enables the generation of /boot/extlinux/extlinux.conf
      generic-extlinux-compatible.enable = true;
    };
    # always update the kernel to the latest for security patches.
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
