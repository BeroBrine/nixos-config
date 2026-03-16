{ config, pkgs, lib, inputs, username, hostname, ... }:

{
  # ... other settings ...

  boot.kernelPackages = lib.mkForce (let
    fairydustKernel = pkgs.buildLinux rec {
      pname = "linux-asahi-fairydust";
      version = "6.18.10";  # Update if the branch has advanced (check AsahiLinux/linux fairydust)
      modDirVersion = version;

      src = pkgs.fetchFromGitHub {
        owner = "AsahiLinux";
        repo = "linux";
        rev = "fairydust";
        hash = "sha256-5eAgJTKcRdjEFzHDSrh/XReaT6Db9YN2RN1SwOs28NE=";  # Nix will suggest the correct one if outdated
      };

      # Add the essential Asahi config options manually (from your original snippet + module defaults)
      kernelPatches = [
        {
          name = "Asahi required config";
          patch = null;
          structuredExtraConfig = with lib.kernel; {
            # Core for Apple Silicon / GPU / power management
            ARM64_16K_PAGES = yes;
            ARM64_MEMORY_MODEL_CONTROL = yes;
            ARM64_ACTLR_STATE = yes;
            APPLE_WATCHDOG = yes;
            APPLE_M1_CPU_PMU = yes;
            HID_APPLE = module;
            APPLE_PMGR_MISC = yes;
            APPLE_PMGR_PWRSTATE = yes;

            # Energy model / schedutil prereqs (already forced by module, but good to have)
            ENERGY_MODEL = yes;
            CPU_FREQ_GOV_SCHEDUTIL = yes;
          };
          features.rust = true;  # Rust support is default in recent Asahi kernels
        }
      ] ++ config.boot.kernelPatches;  # Preserve any extra patches you add elsewhere

      extraMeta.branch = "6.18";

      # If the build complains about config mismatches or ignored options:
      # ignoreConfigErrors = true;  # Uncomment if needed during testing
    };
  in pkgs.linuxPackagesFor fairydustKernel);

  # Optional: extra debug params for fairydust DP alt mode testing
  # boot.kernelParams = lib.mkAfter [
  #   "apple_drm.debug=0x1f"
  #   "dyndbg=\"file drivers/gpu/drm/apple/* +p\""
  # ];

  # ... rest of your config ...
}
