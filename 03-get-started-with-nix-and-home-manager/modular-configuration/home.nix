{ pkgs, ... }:

{
  home.username = "zenoix";
  home.homeDirectory = "/home/zenoix";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [ go ];

  programs.home-manager.enable = true;
}
