{config, ...}: {
  flake.modules.nixos.dev = {
    home-manager.users.${config.flake.meta.owner.username}.imports = [
      (homeArgs: {
        imports = [config.flake.modules.homeManager.sops-nix];

        sops.secrets = {
          "ssh_github_rw_private_key" = {
            path = "${homeArgs.config.home.homeDirectory}/.ssh/id_github_rw";
          };
        };

        programs.ssh = {
          enable = true;
          # Avoids infinite hang if control socket connection interrupted. ex: vpn goes down/up
          serverAliveCountMax = 3;
          serverAliveInterval = 5; # 3 * 5s
          matchBlocks = {
            "gh-mma" = {
              hostname = "github.com";
              user = "git";
              identitiesOnly = true;
              identityFile = homeArgs.config.sops.secrets."ssh_github_rw_private_key".path;
            };
          };
        };
      })
    ];
  };
}
