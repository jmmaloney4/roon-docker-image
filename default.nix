{ pkgs ? import <nixpkgs> { config = { allowUnfree = true; }; } }:

pkgs.dockerTools.buildLayeredImage {
  name = "roon-server";
  config = {
    Cmd = [ "${pkgs.roon-server}/bin/RoonServer" ];
  };
}