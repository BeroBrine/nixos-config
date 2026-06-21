{
  pkgs,
  hostname,
  options,
  ...
}: {
  networking = {
    hostName = "${hostname}";
    networkmanager = {
	enable = true;
	wifi.backend = "iwd";
    };
    timeServers = options.networking.timeServers.default ++ ["pool.ntp.org"];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        59010
        59011
        8080
      ];
      allowedUDPPorts = [
        59010
        59011
        41641 # Tailscale default port
      ];
    };
    # Trust tailscale interface
    firewall.trustedInterfaces = [ "tailscale0" ];
  };
}
