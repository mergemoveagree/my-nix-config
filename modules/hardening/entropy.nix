{
  flake.modules.nixos.base = {
    services.jitterentropy-rngd.enable = true;
    boot.kernelModules = ["jitterentropy_rng"];
  };
}
