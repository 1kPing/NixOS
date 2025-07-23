{ config, pkgs, ... }: {

  users.users.j = {
    isNormalUser = true;
    description = "j";
    extraGroups = [ "input" "networkmanager" "tty" "wheel" ];
    packages = with pkgs; [];
  };

#  services.getty.autologinUser = "j";

}

