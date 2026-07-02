{
  flake.nixosModules.sddm =
    {
      pkgs,
      config,
      inputs,
      ...
    }:
    {
      imports = [ inputs.qylock.nixosModules.qylock ];

      programs.qylock = {
        enable = true;
        sddm-theme = config.settings.qylock-theme;
        sddm-font = config.settings.qylock-sddm-font;
        lock-theme = config.settings.qylock-lock-theme;
        lock-font = config.settings.qylock-sddm-font;
      };

      environment.systemPackages = [
        pkgs.kdePackages.qtmultimedia
      ];
    };
}
