{
  flake.modules.nixos.systemd-boot = {
    boot.loader.systemd-boot.enable = true;
    boot.initrd.systemd.enable = true;
  };
}
