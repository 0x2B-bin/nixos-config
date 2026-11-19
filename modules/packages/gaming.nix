{
  flake.nixosModules.gaming-packages =
    { pkgs, inputs, ... }:
    {
      nixpkgs.overlays = [ inputs.millennium.overlays.default ];

      environment.systemPackages = with pkgs; [
        osu-lazer-bin
        protonplus
        #pcsx2; add back in later, build error
        gamescope
        (pkgs.symlinkJoin {
          name = "lunarclient-wrapped";
          paths = [ pkgs.lunar-client ];
          buildInputs = [ pkgs.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/lunarclient \
             --set SDL_VIDEO_DRIVER wayland
          '';
        })
        lunar-client
        protontricks
        lutris-unwrapped
        sunshine
      ];

      programs = {
        steam = {
          enable = true;
          package = pkgs.millennium-steam;
        };
        gamescope.enable = true;
      };
    };
}
