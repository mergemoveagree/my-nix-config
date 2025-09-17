{
  flake.modules.nixos.pc = {
    networking.networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };
}
