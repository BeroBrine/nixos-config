{lib , pkgs , ...}:{
  home.packages = [pkgs.obsidian];
  # home.file = {
  #   ".vault" = {
  #     source = builtins.fetchGit {
  #       url = "https://github.com/BeroBrine/obsidian";
  #       rev = "f51ca8fe249c588150300fddf2612493d05ed3cf";
  #     };
  #     recursive = true;
  #   };
  # };
}
