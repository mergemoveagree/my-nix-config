{
  flake.modules.homeManager.base = {
    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
    };

    programs.bash.shellAliases = {
      cd = "z";
    };
  };
}
