{config, ...}: {
  flake.modules.nixos.dev = {
    home-manager.users.${config.flake.meta.owner.username}.imports = [
      ({
        osConfig,
        pkgs,
        ...
      }: {
        programs.helix = {
          extraPackages = with pkgs; [
            alejandra
            nixd
            gopls
            typescript-language-server
            superhtml
          ];
          languages = {
            language = [
              {
                name = "nix";
                language-servers = ["nixd"];
                auto-format = true;
              }
              {
                name = "go";
                language-servers = ["gopls"];
              }
              {
                name = "javascript";
                language-servers = ["typescript-language-server"];
              }
              {
                name = "html";
                language-servers = ["superhtml"];
                file-types = ["tmpl" "html"];
              }
            ];
            language-server.nixd = {
              command = "nixd";
              args = ["--semantic-tokens=true"];
              config.nixd = let
                myFlake = "(builtins.getFlake \"/etc/nixos\")";
                nixosOpts = "${myFlake}.nixosConfigurations.${osConfig.networking.hostName}.options";
              in {
                nixpkgs.expr = "import ${myFlake}.inputs.nixpkgs { }";
                formatting.command = ["alejandra"];
                options = {
                  nixos.expr = nixosOpts;
                  home-manager.expr = "${nixosOpts}.home-manager.users.type.getSubOptions []";
                };
              };
            };
          };
        };
      })
    ];
  };
}
