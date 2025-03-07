{hostname , ...}:{
  networking = {
    hostName = "${hostname}";
    networkmanager.enable = true;
  };
  time.timeZone = "Asia/Calcutta";
}
