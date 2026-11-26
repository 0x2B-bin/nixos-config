{
  perSystem = { pkgs, ... }: 
  let
    mkKitty = { ... }@configArgs:
    let
      config = pkgs.callPackage ./_config.nix configArgs;
    in
      pkgs.symlinkJoin {
        name = "kitty-wrapped";
        paths = with pkgs; [ kitty ];
        nativeBuildInputs = [ pkgs.makeWrapper ];

        postBuild = ''
          wrapProgram $out/bin/kitty \
            --set KITTY_CONFIG_DIRECTORY "${config}/share/kitty"
        '';

        meta = {
          mainProgram = "kitty";
        };
      };
  in
  {
    packages.kitty = pkgs.lib.makeOverridable mkKitty {};
  };
}
