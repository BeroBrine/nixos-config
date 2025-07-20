{username , inputs ,pkgs ,  ...}:{

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["wheel"  "input"  "networkmanager"  "uinput"];
    shell = pkgs.zsh;
  };
  users.groups.uinput = {};
}
