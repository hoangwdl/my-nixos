{ pkgs, ... }:

{
  home.username = "hoang";
  home.homeDirectory = "/home/hoang";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = [
    pkgs.htop
  ];
}

