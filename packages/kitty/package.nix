{
  perSystem = { pkgs, ... }: 
  let
    config = pkgs.callPackage ./_config.nix {};
  in
  {
    packages.kitty = pkgs.symlinkJoin {
      name = "kitty-wrapped";
      paths = with pkgs; [ kitty ];
      nativeBuildInputs = [ pkgs.makeWrapper ];

      postBuild = ''
        wrapProgram $out/bin/kitty \
          --add-flags "--config ${config}"
      '';

      meta = {
        mainProgram = "kitty";
      };
    };
  };
}
