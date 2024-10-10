{
  description = "maxhallinan/scripts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        packageName = "maxhallinan-scripts";
      in {
        packages.ggit-checkout = pkgs.writeShellScriptBin "ggit-checkout"
          ''
            echo "Hello World!";
            echo $1;
          '';
      });
}
