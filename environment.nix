{ config, ... }: {

  environment = {
    variables = {
      DEFAULT_BROWSER = "librewolf";
      EDITOR = "nvim";
      QT_QPA_PLATFORMTHEME = "gtk3";
    };
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };

  xdg.mime.defaultApplications = {
    "text/html" = "librewolf.desktop";
    "x-scheme-handler/http" = "librewolf.desktop";
    "x-scheme-handler/https" = "librewolf.desktop";
    "x-scheme-handler/about" = "librewolf.desktop";
    "x-scheme-handler/unknown" = "librewolf.desktop";
  };

}

