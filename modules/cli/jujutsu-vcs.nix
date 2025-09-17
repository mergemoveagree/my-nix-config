{config, ...}: {
  flake.modules.nixos.base = {
    home-manager.users.${config.flake.meta.owner.username}.imports = [
      {
        programs.jujutsu.enable = true;
        programs.jujutsu.settings = {
          user = {
            name = config.flake.meta.owner.name;
            email = config.flake.meta.owner.email;
          };

          ui = {
            editor = "hx";
            show-cryptographic-signatures = true;
          };

          signing = {
            backend = "gpg";
            behavior = "own";
            key = config.flake.meta.owner.email;
          };
        };
      }
    ];
  };
}
