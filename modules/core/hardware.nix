{
  hardware = {
    uinput.enable = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = false;
    # fore asahi
    asahi = {
      peripheralFirmwareDirectory = ./firmware;
    };
  };
}
