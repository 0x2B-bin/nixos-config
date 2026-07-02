{
  perSystem =
    { pkgs, ... }:
    let
      base = pkgs.appimageTools.defaultFhsEnvArgs;
    in
    {
      packages.fhs = pkgs.buildFHSEnv (
        base
        // {
          name = "fhs";
          targetPkgs =
            pkgs:
            (base.targetPkgs pkgs)
            ++ (with pkgs; [
              pkgs.pkgsi686Linux.glibc
              pkg-config
              ncurses
            ]);

          profile = "export FHS=1";
          runScript = "zsh";
          extraOutputsToInstall = [ "dev" ];
        }
      );
    };
}
