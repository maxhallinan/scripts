{ pkgs, ... }:
{
  ggit-checkout = pkgs.writeShellScriptBin "ggit-checkout"
    ''
      echo "Hello World!";
      gco $1;
      echo $1;
    '';
}
