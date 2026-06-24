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
      fairydustKernel =
        (pkgs.buildLinux rec {
          pname = "linux-asahi-fairydust";
          version = "7.0.13";
          modDirVersion = version;

          src = pkgs.fetchFromGitHub {
            owner = "AsahiLinux";
            repo = "linux";
            rev = "fairydust";
            hash = "sha256-sGcgrrf/rpb8u9dvwiTFdNjp18UyuRhW94biH1WMO5I=";
          };

          kernelPatches = [
            {
              name = "Asahi required config + Linux 7.0 DP Alt Mode";
              patch = null;
              structuredExtraConfig = with lib.kernel; {
                # Core Apple Silicon & GPU Management
                ARM64_16K_PAGES = yes;
                ARM64_MEMORY_MODEL_CONTROL = yes;
                ARM64_ACTLR_STATE = yes;
                APPLE_WATCHDOG = yes;
                APPLE_M1_CPU_PMU = yes;
                HID_APPLE = module;
                APPLE_PMGR_MISC = yes;
                APPLE_PMGR_PWRSTATE = yes;

                # Energy model prerequisites
                ENERGY_MODEL = yes;
                CPU_FREQ_GOV_SCHEDUTIL = yes;

                # DisplayPort Alt Mode & Type-C Crossbar
                TYPEC = yes;
                TYPEC_DP_ALTMODE = module;
                DRM_APPLE = module;
              };
              features.rust = true;
            }
          ]
          ++ config.boot.kernelPatches;

          extraMeta.branch = "7.0";

        }).overrideAttrs
          (old: {
            # Hook into postPatch to modify the raw kernel source before compilation.
            # This loops over all M2 (t8112) Devicetrees and prepends the PMP macro to line 1.
            postPatch = (old.postPatch or "") + ''
              echo "Prepending #define APPLE_USE_PMP 1 to target Apple Silicon DTS files..."
              for dts in arch/arm64/boot/dts/apple/t8112*.dts; do
                echo "#define APPLE_USE_PMP 1" > "$dts.tmp"
                cat "$dts" >> "$dts.tmp"
                mv "$dts.tmp" "$dts"
              done
            '';
          });
    in
    pkgs.linuxPackagesFor fairydustKernel
  );
}
