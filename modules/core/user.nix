{username , inputs ,pkgs ,  ...}:{

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["wheel"  "input"  "networkmanager"  "uinput"  "i2c"];
    shell = pkgs.zsh;
  };
  users.groups.uinput = {};
}
