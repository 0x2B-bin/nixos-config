{
  flake.nixosModules.plymouth =
    { pkgs, ... }:
    {
      boot.plymouth = {
        enable = true;
        theme = "nier";

        themePackages = [
          (pkgs.stdenv.mkDerivation {
            pname = "plymouth-theme-nier";
            version = "1.0";
            src = ../../dotfiles/plymouth/nier;

            dontUnpack = true;

            installPhase = ''
              mkdir -p $out/share/plymouth/themes/nier
              cp -r $src/. $out/share/plymouth/themes/nier/

              chmod -R +w $out/share/plymouth/themes/nier/
              sed -i "s|@out@|$out|" $out/share/plymouth/themes/nier/nier.plymouth
            '';
          })
        ];
      };
    };
}
