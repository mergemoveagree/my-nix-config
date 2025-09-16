{config, ...}: {
  flake.modules.nixos.base = {
    home-manager.users.${config.flake.meta.owner.username}.imports = [
      {
        programs.git = {
          enable = true;
          userName = config.flake.meta.owner.name;
          userEmail = config.flake.meta.owner.email;
          signing = {
            format = "openpgp";
            key = "8EADAD0C40C5870F6F11E478756848B1A2B0FD8D";
            signByDefault = true;
          };
          extraConfig = {
            init.defaultBranch = "main";
            url = {
              "https://github.com/" = {
                insteadOf = [
                  "gh:"
                  "github:"
                ];
              };
            };
          };
        };
      }
    ];
  };
}
