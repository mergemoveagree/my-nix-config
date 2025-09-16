{
  flake.modules.homeManager.gui = {pkgs, ...}: {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      nerd-fonts.fira-code
      font-awesome
    ];

    programs.ghostty = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        font-family = "FiraCode Nerd Font Mono";
        font-size = 12;
        theme = "DjangoRebornAgain";
      };
    };
  };
}
