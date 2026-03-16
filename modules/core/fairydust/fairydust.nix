{ config, pkgs, lib, inputs, ... }:

let
  fairydustKernel = lib.mkForce (pkgs.linux-asahi.override {
    src = inputs.fairydust;
    # Remove hardcoded version - let it auto-detect
  }).kernel;
in {
  boot.kernelPackages = lib.mkForce (pkgs.linuxPackagesFor fairydustKernel);
  hardware.asahi.enable = true;
  
  boot.kernelParams = lib.mkAfter [
    "apple_atc.debug=1"
    "apple_dcp.show_notch=1"
  ];
  
  boot.consoleLogLevel = lib.mkDefault 7;
}
