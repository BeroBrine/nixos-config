{
  config,
  pkgs,
  lib,
  inputs,
  username,
  hostname,
  ...
}:
{
  boot.kernelPackages = lib.mkForce (
    let
      fairydustKernel = pkgs.buildLinux rec {
        pname = "linux-asahi-fairydust";
        version = "7.0.13"; # Aligned with the Asahi Linux 7.0.x upstream base
        modDirVersion = version;

        src = pkgs.fetchFromGitHub {
          owner = "AsahiLinux";
          repo = "linux";
          rev = "fairydust"; # Points to the live rolling developer preview ref
          # Fake hash forces Nix to pull the absolute latest upstream rebase.
          # Replace this string with the actual SHA256 hash Nix outputs on your first build attempt.
          hash = "sha256-sGcgrrf/rpb8u9dvwiTFdNjp18UyuRhW94biH1WMO5I=";
        };

        kernelPatches = [
          {
            name = "Asahi required config + Linux 7.0 DisplayPort Alt Mode";
            patch = null;
            structuredExtraConfig = with lib.kernel; {
              # Core Apple Silicon / GPU / System power management
              ARM64_16K_PAGES = yes;
              ARM64_MEMORY_MODEL_CONTROL = yes;
              ARM64_ACTLR_STATE = yes;
              APPLE_WATCHDOG = yes;
              APPLE_M1_CPU_PMU = yes;
              HID_APPLE = module;
              APPLE_PMGR_MISC = yes;
              APPLE_PMGR_PWRSTATE = yes;

              # Linux 7.0 Power Management Processor (PMP) for deep block sleep
              # APPLE_USE_PMP = yes;

              # Energy model & CPU frequency scaling prerequisites
              ENERGY_MODEL = yes;
              CPU_FREQ_GOV_SCHEDUTIL = yes;

              # USB Type-C Crossbar (DPXBAR) & DisplayPort Alt Mode routing
              TYPEC = yes;
              TYPEC_DP_ALTMODE = module;
              DRM_APPLE = module; # Hardware display coprocessor (DCP) driver
            };
            features.rust = true; # Required for DRM_APPLE bindings to compile
          }
        ]
        ++ config.boot.kernelPatches; # Preserves custom patches defined elsewhere in your flake

        extraMeta.branch = "7.0"; # Ensures external module builds map correctly
      };
    in
    pkgs.linuxPackagesFor fairydustKernel
  );
}
