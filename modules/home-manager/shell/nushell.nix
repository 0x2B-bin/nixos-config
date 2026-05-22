{
  flake.homeModules.nushell = {
    programs.nushell = {
      enable = true;

      shellAliases = {
        c = "clear";
        n = "nvim";
        sshk = "kitty +kitten ssh";
        ff = "fastfetch";
        po = "poweroff";
      };

      configFile.text = ''
        $env.LS_COLORS = "di=34:ln=36:fi=0:ex=32:*.txt=31:*.mp4=33"
        $env.config = {
          use_ansi_coloring: 'auto'
          show_banner: false
        }
      '';
    };
  };
}
