{config, ...}: {
  flake.modules.nixos.pc = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      protonvpn-gui
    ];

    home-manager.users.${config.flake.meta.owner.username}.imports = [
      {
        xdg.autostart = {
          enable = true;
          entries = [
            "${pkgs.protonvpn-gui}/share/applications/protonvpn-app.desktop"
          ];
        };
      }
    ];
  };
}
