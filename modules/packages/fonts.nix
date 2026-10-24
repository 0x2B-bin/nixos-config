{
  flake.nixosModules.fonts =
    { pkgs, inputs, ... }:
    {
      fonts.packages = with pkgs; [
        texlivePackages.jetbrainsmono-otf
        texlivePackages.fontawesome
        nerd-fonts.jetbrains-mono
        monocraft
        miracode
        inputs.galmuri14.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
