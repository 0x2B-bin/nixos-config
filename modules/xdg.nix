{
  flake.nixosModules.xdg = { pkgs, inputs, ... }: {
    xdg = {
      portal = {
        enable = true;
        extraPortals = [
          inputs.luciole.packages.${pkgs.stdenv.hostPlatform.system}.default
          pkgs.xdg-desktop-portal-gtk
        ];
        config.common = {
          default = [ "gtk" ];  
          "org.freedesktop.impl.portal.FileChooser" = [ "luciole" "gtk" ];
        };
      };
      mime.defaultApplications = {
        "image/png" = "zen-beta.desktop";
        "image/jpeg" = "zen-beta.desktop";
      };
    };
  };
}
