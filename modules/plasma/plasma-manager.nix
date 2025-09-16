{inputs, ...}: {
  flake.modules.homeManager.gui = {
    imports = [inputs.plasma-manager.homeModules.plasma-manager];
    programs.plasma = {
      enable = true;
      overrideConfig = true;

      workspace = {
        clickItemTo = "select";
        lookAndFeel = "org.kde.breezedark.desktop";
      };

      krunner = {
        shortcuts = {
          launch = "Meta+R";
        };
      };

      shortcuts = {
        "services/com.mitchellh.ghostty.desktop" = {
          "new-window" = "Meta+Q";
        };
      };
    };
  };
}
