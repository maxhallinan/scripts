{
  description = "maxhallinan/shell-scripts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        packageName = "shell-scripts";
      in {
        packages.hello-world = pkgs.writeShellApplication {
          name = "hello-world";

          runtimeInputs = [ pkgs.cowsay ];

          text = builtins.readFile ./scripts/hello-world.sh;
        };
      });
}
