{username , inputs ,pkgs ,  ...}:{

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["wheel"  "input"  "networkmanager"];
    shell = pkgs.zsh;
  };
  users.groups.uinput = {};
}
