{hostname , ...} :
let
  inherit (import ../../../../hosts/${hostname}/variables.nix) gitUsername gitEmail;
in
{
  programs = {
    git = {
      enable = true;
      userName = gitUsername;
      userEmail = gitEmail;
    };
  };
}
