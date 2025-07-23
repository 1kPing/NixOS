{ config, pkgs, ... }: {

  imports = [
    ./hardware.nix
    ./system.nix
    ./services.nix
    ./networking.nix
    ./environment.nix
    ./users.nix
    ./desktop.nix
    ./packages.nix
    ./overlays.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";

}

