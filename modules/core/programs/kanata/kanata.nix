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
    };
  };
  environment.systemPackages = with pkgs; [kanata];
}
