{
  flake.modules.nixos.pc = {pkgs, ...}: let
    protonvpn-autostart = pkgs.makeAutostartItem {
      name = "protonvpn-app";
      package = pkgs.protonvpn-gui;
    };
  in {
    environment.systemPackages = with pkgs; [
      protonvpn-gui
      protonvpn-autostart
    ];
  };
}
