# In your home.nix
{ pkgs, ... }:

{
  home.packages =with pkgs; [
    nodejs
    yarn
  ];

  # This is the important part: we'll create the .yarnrc.yml file
  # with the correct yarn version.

}
