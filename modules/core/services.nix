{ pkgs, ... }:
{
  services = {

    postgresql = {
      enable = true;
      package = pkgs.postgresql;
      ensureDatabases = [
        "sabi"
        "abhishek"
      ];
      ensureUsers = [
        {
          name = "abhishek";
          ensureDBOwnership = true;
          ensureClauses = {
            superuser = true;
          };
        }
      ];

      authentication = pkgs.lib.mkOverride 10 ''
        local   all             all                                     trust
        host    all             all             127.0.0.1/32            trust
        host    all             all             ::1/128                 trust
      '';
    };

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
    };

    libinput.enable = true;
    fstrim.enable = true;
    gvfs.enable = true;
    openssh.enable = true;
    blueman.enable = true;
    tumbler.enable = true;
    gnome.gnome-keyring.enable = true;
    upower.enable = true;

    # this one works on asahi
    power-profiles-daemon.enable = true;

    # auto cpufreq does not work on asahi due to underlying hardware issue

    # auto-cpufreq = {
    #   enable = true;
    #   settings = {
    #     battery = {
    #       turbo = "never";
    #     };
    #   };
    # };

    smartd = {
      enable = true;
      autodetect = true;
    };

    udev.extraRules = ''
      # I2C permissions for user access (e.g., for ddcutil or light)
      KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"

      # Battery charge control for Apple Silicon (macsmc)
      # Sets the charge limit to 90% and start threshold to 80% to preserve battery health
      SUBSYSTEM=="power_supply", KERNEL=="macsmc-battery", ATTR{charge_control_end_threshold}="90", ATTR{charge_control_start_threshold}="80"
    '';
  };

}
