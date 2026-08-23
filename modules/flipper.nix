{
  flake.nixosModules.flipper =
    { inputs, pkgs, ... }:
    {
      hardware.flipperzero.enable = true;

      environment.systemPackages = [
        inputs.ufbt.packages."${pkgs.stdenv.hostPlatform.system}".default
      ];
    };
}
