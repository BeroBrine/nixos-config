{ ... }:
{
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = {
      bar.position = "bottom";
    };
  };
}
