{ ... }:
{
  services = {
    hypridle = {
      enable = true;
      settings = {
        general = {
          after_sleep_cmd = "hyprctl dispatch dpms on";
          ignore_dbus_inhibit = false;
          lock_cmd = "caelestia shell lock";
          };
        listener = [
          {
            timeout = 10 * 60  * 60;
            on-timeout = "caelestia shell lock";
          }
          {
            timeout = 15 * 60 * 60;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}
