{ pkgs, ... }:

{
  home.username = "zenoix";
  home.homeDirectory = "/home/zenoix";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [ go ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "johndoe";
    userEmail = "johndoe9919231@gmail.com";
  };
}
