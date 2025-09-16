{
  flake.modules.nixos.hardening = {
    pkgs,
    config,
    ...
  }: let
    interfaceName = config.networking.primaryInterface;
  in {
    systemd.services.macchanger = {
      enable = true;
      description = "macchanger on ${interfaceName}";
      wants = ["network-pre.target"];
      before = ["network-pre.target"];
      bindsTo = ["sys-subsystem-net-devices-${interfaceName}.device"];
      after = ["sys-subsystem-net-devices-${interfaceName}.device"];
      wantedBy = ["multi-user.target"];
      restartIfChanged = false;
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.macchanger}/bin/macchanger -e ${interfaceName}";
        RemainAfterExit = true;
      };
    };
  };
}
