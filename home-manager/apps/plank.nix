{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> {};
in
{
  home.packages = with pkgs; [
    unstable.plank
  ];
}