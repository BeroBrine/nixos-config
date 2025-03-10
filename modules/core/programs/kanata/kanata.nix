{pkgs ,...}:{
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };
  services = {
    kanata = {
      enable = true;
      keyboards = {
        internalKeyboard = {
          devices = ["/dev/input/by-path/platform-i8042-serio-0-event-kbd"];
          configFile = ./config.kbd;
        };
      };
    };
  };
  environment.systemPackages = with pkgs; [kanata];
}
