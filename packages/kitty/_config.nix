{
    pkgs,
    lib,
    includeTheme ? true,
}:
let
  config =  ''
    shell_integration no-rc
    ${lib.optionalString includeTheme "include /home/nate/.config/kitty/theme.conf"}
    background_opacity    0.75
    font_family      family="JetBrainsMono Nerd Font"
    cursor_trail 1
    enable_audio_bell no
    tab_bar_edge top
    tab_bar_style powerline
  '';
in
pkgs.writeText "kitty.conf" config
