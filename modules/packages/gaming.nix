{
  flake.nixosModules.gaming-packages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        steam
        osu-lazer-bin
        protonplus
        #pcsx2; add back in later, build error
        gamescope
        lunar-client
      ];

      programs = {
        steam.enable = true;
        gamescope.enable = true;
      };
    };
}
