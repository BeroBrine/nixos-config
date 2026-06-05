{ pkgs, ... }:
{
  programs = {
    dconf.enable = true;
  };

  environment.systemPackages = with pkgs; [
    appimage-run # Needed For AppImage Support
    brightnessctl # For Screen Brightness Control
    docker-compose # Allows Controlling Docker From A Single File
    duf # Utility For Viewing Disk Usage In Terminal
    eza # Beautiful ls Replacement
    networkmanagerapplet
    tuigreet # The Login Manager (Sometimes Referred To As Display Manager)
    mesa-demos
    hyprpicker # Color Picker
    eog # For Image Viewing
    killall # For Killing All Instances Of Programs
    libnotify # For Notifications
    lm_sensors # Used For Getting Hardware Temps
    ncdu # Disk Usage Analyzer With Ncurses Interface
    nixfmt-rfc-style # Nix Formatter
    pavucontrol # For Editing Audio Levels & Devices
    pciutils # Collection Of Tools For Inspecting PCI Devices
    playerctl # Allows Changing Media Volume Through Scripts
    ripgrep # Improved Grep
    socat # Needed For Screenshots
    sox # audio support for FFMPEG
    unrar # Tool For Handling .rar Files
    unzip # Tool For Handling .zip Files
    usbutils # Good Tools For USB Devices
    v4l-utils # Used For Things Like OBS Virtual Camera
    wget # Tool For Fetching Files With Links
    diesel-cli
    webcamoid
    ffmpeg
    vim
    neovim
    ncurses
    # pipx
    git
    fastfetch
    ddcutil
    gcc
    clang
    fzf
    # rust related
    rustup
    rustc
    cargo
  ];

}
