{pkgs,...}:{

  services.xserver.videoDrivers = ["intel"];
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ]; 
    };
  };
}

