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
        packages.edit-changed-files = pkgs.writeShellApplication {
          name = "edit-changed-files";

          runtimeInputs = [pkgs.git];

          text = builtins.readFile ./scripts/edit-changed-files.sh;
        };
        packages.create-filepath = pkgs.writeShellApplication {
          name = "create-filepath";

          runtimeInputs = [];

          text = builtins.readFile ./scripts/create-filepath.sh;
        };
        packages.python-hello-world = pkgs.python3Packages.buildPythonApplication rec {
          pname = "hello-world";
          version = "0.0.1";
          src = ./scripts/hello-world.py;
          build-system = with pkgs.python3Packages; [
            setuptools
            wheel
          ];

        };
        packages.bash-hello-world = pkgs.writeShellApplication {
          name = "hello-world";

          runtimeInputs = [ pkgs.cowsay ];

          text = builtins.readFile ./scripts/hello-world.sh;
        };
      });
}
