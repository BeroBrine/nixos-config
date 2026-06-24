{
  imports = [
    ./hardware.nix
    ./nixos.nix
    ./system.nix
    ./apple-silicon-support
    ### EXTERNAL DISPLAY SUPPORT EXPERIMENTAL KERNEL ####
    ./fairydust.nix
    ./external-display.nix
  ];
}
