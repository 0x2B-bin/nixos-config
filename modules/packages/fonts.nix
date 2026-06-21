{
  flake.nixosModules.fonts =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        texlivePackages.jetbrainsmono-otf
        texlivePackages.fontawesome
        nerd-fonts.jetbrains-mono
        monocraft
        miracode
      ];
    };
}
