{ pkgs, ... }: {
  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    swappy
    cliphist
    ydotool
    hyprpolkitagent
    uwsm
    awww
  ];
}
