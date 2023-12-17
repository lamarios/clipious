# usage:
# build the image
# nix-build -o result bundletool.nix
# docker load -i result
# use the image as usual with name gonzague/bundletool
{
  pkgs ? import <nixpkgs> {system = "x86_64-linux";}
}:
pkgs.dockerTools.buildLayeredImage {
  name = "gonzague/bundletool";
  tag = "latest";
  contents = with pkgs; [ wget bundletool aapt bash which android-tools ];
}