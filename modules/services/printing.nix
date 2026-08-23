{
  flake.nixosModules.printing =
    {
      pkgs,
      ...
    }:
    {
      services.avahi = {
        enable = true;
        openFirewall = true;
        nssmdns4 = true;
      };

      services.printing = {
        enable = true;
        drivers = with pkgs; [
          cups-filters
          cups-browsed
          gutenprint
          ghostscript
        ];
      };
    };
}
