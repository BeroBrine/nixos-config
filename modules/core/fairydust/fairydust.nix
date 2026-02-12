{ config, pkgs, lib, inputs, ... }:

let

  fairydustKernel = (pkgs.linux-asahi.override {
    src = inputs.fairydust;

    version = "6.18.7";  
    modDirVersion = "6.18.7";

  }).kernel; 

in {
  # Use the overridden kernel
  boot.kernelPackages = lib.mkForce (pkgs.linuxPackagesFor fairydustKernel);

  hardware.asahi.enable = true;  # ensure it's on

  # If external display needs specific params (experimental)
  boot.kernelParams = lib.mkAfter [
    "apple_atc.debug=1"          # more logs for USB-C / ATC PHY / DP negotiation
    # "video=DP-1:1920x1080@60"  # force mode if auto-detect fails (adjust connector)
  ];

  # For debugging
  boot.consoleLogLevel = lib.mkDefault 7;
}
