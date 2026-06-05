{
  pkgs,
  username,
  ...
}:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "abhishek";
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd Hyprland"; # start Hyprland with a TUI login manager
      };
    };
  };
}
