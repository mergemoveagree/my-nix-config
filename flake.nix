{
  nixConfig = {
    abort-on-warn = true;
    extra-experimental-features = ["pipe-operators"];
    allow-import-from-derivation = false;
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-25.05";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    import-tree.url = "github:vic/import-tree";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [(inputs.import-tree ./modules)];
      _module.args.rootPath = ./.;
    };
}
