{ pkgs, ... }:
{
  services = {
    kanata = {
      enable = true;
      keyboards = {
        laptop = {
          # devices = ["/dev/input/by-id/usb-ITE_Tech._Inc._ITE_Device_8910_-event-kbd"];
          devices = [ "/dev/input/by-path/platform-24eb30000.input-event-kbd" ];
          config = builtins.readFile ./config.kbd;
        };

        mechanical = {
          devices = [ "/dev/input/by-id/usb-Telink_Wireless_Gaming_Keyboard-event-kbd" ];
          config = builtins.readFile ./mechanical.kbd;
        };
      };
    };

  };

  environment.systemPackages = with pkgs; [ kanata ];
}
