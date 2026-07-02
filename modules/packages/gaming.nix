{
  flake.nixosModules.gaming-packages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        steam
        osu-lazer-bin
        protonplus
        pcsx2
        gamescope
        lunar-client
      ];

      programs = {
        steam.enable = true;
        gamescope.enable = true;
      };
    };
}
