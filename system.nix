{ config, pkgs, ... }: {

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
#    kernel = {
#      sysctl = {
#	"vm.swappiness" = 90;
#      };
    loader = {
      systemd-boot.enable = false;
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
#        useOSProber = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };

  time.timeZone = "America/Chicago";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  security = {
    sudo = {
      enable = false;
    };
    sudo-rs = {
      enable = true;
    };
#    doas = {
#      enable = true;
#      extraRules = [{
#        groups = ["wheel"];
#        keepEnv = true;  # Optional, retains environment variables while running commands 
#                         # e.g. retains your NIX_PATH when applying your config
#        persist = true;  # Optional, only require password verification a single time
#      }];
#    };
    rtkit.enable = true;
  };

#  systemd.services."systemd-run".serviceConfig.ExecStart = "/bin/true";

}

