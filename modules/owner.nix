{config, ...}: {
  flake = {
    meta.owner = {
      email = "hi@jaden.rs";
      name = "Jaden Nola";
      username = "jaden";
    };

    modules = {
      nixos.base = {
        users.users.${config.flake.meta.owner.username} = {
          isNormalUser = true;
          initialPassword = "";
          extraGroups = ["input"];
        };

        nix.settings.trusted-users = [config.flake.meta.owner.username];
      };
    };
  };
}
