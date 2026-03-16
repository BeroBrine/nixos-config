{
  pkgs,
  config,
  hostname,
  ...
}:let inherit
  (import ../../../../hosts/${hostname}/variables.nix) styliximage;
  in {
  programs = {
    rofi = {
      enable = true;
      package = pkgs.rofi;
      theme = ./theme.rasi; 
    };
  };
}
