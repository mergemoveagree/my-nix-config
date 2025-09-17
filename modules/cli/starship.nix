{
  flake.modules.homeManager.gui.programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = builtins.fromTOML (builtins.readFile ./gruvbox-rainbow.toml);
  };
}
