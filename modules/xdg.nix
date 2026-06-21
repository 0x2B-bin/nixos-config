{
  flake.nixosModules.xdg = {
    xdg.mime.defaultApplications = {
      "image/png" = "zen-beta.desktop";
      "image/jpeg" = "zen-beta.desktop";
    };
  };
}
