{
  flake.nixosModules.plymouth =
    { pkgs, inputs, ... }:
    {
      imports = [ inputs.mikuPlymouth.nixosModules.default ];

      boot.plymouth = {
        enable = true;
        theme = "MikuPlymouth";

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
          pkgs.mikuPlymouth
        ];
      };
    };
}
