{ config, pkgs, ... }: {

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
#    configure = {
#      customRC = ''
#        set number
#        set cc=80
#        set list
#        set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
#        if &diff
#          colorscheme blue
#        endif
#      '';
#      packages.myVimPackage = with pkgs.vimPlugins; {
#        start = [ ctrlp ];
#      };
#    };
  };

  programs.steam = {
    enable = true;
#    remotePlay.openFirewall = true;
#    dedicatedServer.openFirewall = true;
  };

  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-wlr
      ];
    };
  };

}

