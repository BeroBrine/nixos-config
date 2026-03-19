{
  hardware = {
    uinput.enable = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = false;
    i2c.enable = false;

    asahi = {
      peripheralFirmwareDirectory = ./firmware;
    };


  };
}
