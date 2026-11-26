{
    pkgs,
    lib,
    includeTheme ? false,
    fontFamily ? "JetBrainsMono Nerd Font",
    opacity ? 0.75
}:
let
  config =  ''
    shell_integration no-rc
    ${lib.optionalString includeTheme "include ~/.config/kitty/theme.conf"}
    background_opacity    ${builtins.toJSON opacity}
    font_family      family="${fontFamily}"
    cursor_trail 1
    enable_audio_bell no
    tab_bar_edge top
    tab_bar_style powerline
  '';
in
pkgs.writeTextDir "share/kitty/kitty.conf" config
