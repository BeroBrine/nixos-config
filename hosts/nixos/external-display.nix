{
  # 1. Force the variables into the literal Systemd User Daemon instance at boot
  systemd.user.extraConfig = ''
    DefaultEnvironment="AQ_DRM_DEVICES=/dev/dri/card2:/dev/dri/card1" "WLR_DRM_DEVICES=/dev/dri/card2:/dev/dri/card1"
  '';

  # 2. Promote sessionVariables to true global environment.variables
  environment.variables = {
    AQ_DRM_DEVICES = "/dev/dri/card2:/dev/dri/card1";
    WLR_DRM_DEVICES = "/dev/dri/card2:/dev/dri/card1";
  };
}
