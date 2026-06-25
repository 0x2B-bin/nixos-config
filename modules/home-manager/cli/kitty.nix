{
  flake.homeModules.kitty = {
    config = {
      programs.kitty = {
        enable = true;
        shellIntegration.enableZshIntegration = true;
        extraConfig = ''
          include theme.conf
          cursor_trail 1
          enable_audio_bell no
        '';
      };
    };
  };
}
