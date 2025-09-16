{
  config,
  lib,
  inputs,
  ...
}: {
  perSystem = {pkgs, ...}: {
    checks =
      {
        base = with config.flake.modules.homeManager; [base];
      }
      |> lib.mapAttrs' (
        name: modules: {
          name = "home-manager/${name}";
          value =
            {
              inherit pkgs;
              modules = modules ++ [{home.stateVersion = "25.05";}];
            }
            |> inputs.home-manager.lib.homeManagerConfiguration
            |> lib.getAttrFromPath [
              "config"
              "home-files"
            ];
        }
      );
  };
}
