{
  perSystem = { pkgs, ... }:
  let
    config = import ./_config.nix;
    configFile = pkgs.writeText "config.jsonc" (builtins.toJSON config.config);
  in
  {
    packages.fastfetch = pkgs.symlinkJoin {
      name = "fastfetch-wrapped";
      paths = with pkgs; [fastfetch ];
      nativeBuildInputs = [ pkgs.makeWrapper ];

      postBuild = ''
        wrapProgram $out/bin/fastfetch \
          --add-flags "--config ${configFile}"
      '';
    };
  };
}
