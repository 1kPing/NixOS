{ config, lib, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
  ];
 
  hardware.graphics.enable = true;

  services = {                           ##############################################
    xserver.videoDrivers = [ "nvidia" ]; #### <-- SWITCH OUT FOR WHAT YOU NEED <-- ####
#    ollama.acceleration = "cuda";       #### <--<--<--<--<--<--<--<--<--<--<--<-- ####
  };                                     ##############################################

####################################################
#### COMMENT OUT WHAT YOU DON'T NEED FROM BELOW ####
####################################################

###########
# AMD GPU

# soon
          #
###########


#############
# INTEL GPU

# soon
            #
#############


##############
# NVIDIA GPU

  boot = {
#    kernelModules = [ "nvidia_uvm" "nvidia_modeset" "nvidia_drm" "nvidia" "glaxnimate" ];
    blacklistedKernelModules = ["nouveau"];
  };

  hardware.nvidia = {
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    nvidiaSettings = true;
    modesetting.enable = true;
#    dynamicBoost.enable = true;
#    nvidiaPersistenced = true;
#    powerManagement = {
#      enable = false;
#      finegrained = false;
#    };
  };

  nixpkgs.config.allowUnfreePredicate = with pkgs; [
    "cuda_cccl"
    "cuda_cudart"
    "cuda_nvcc"
    "libcublas"
  ];
             #
##############

}

