{
  flake.nixosModules.desktop-packages = { pkgs, inputs, ... }:
    {
      environment.systemPackages = with pkgs; [
        vesktop
        aseprite
        audacity
        nwg-look
        steam
        osu-lazer-bin
        protonplus
        pcsx2
        gamescope
        lunar-client
        networkmanagerapplet
        pavucontrol
        ffmpeg
        glib
        gsettings-desktop-schemas
        mpv
        wireshark
        postman
        obs-studio
        qbittorrent
        losslesscut-bin
        awww
        (pywal16.override {
          withColorz = true;
          withModernColorthief = true;
          withFastColorthief = true;
          withHaishoku = true;
        })
        niri
        xwayland-satellite
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
        adwaita-icon-theme
        wl-mirror
        wl-clipboard
        kitty
        mako
        wofi
        brightnessctl
        quickshell
        inputs.henshin.packages."${pkgs.stdenv.hostPlatform.system}".default
        inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
        inputs.hatsune-miku-cursors.packages."${pkgs.stdenv.hostPlatform.system}".default
        inputs.anicursors.packages."${pkgs.stdenv.hostPlatform.system}".default
      ];

      programs = {
        firefox.enable = true;
        niri.enable = true;
        xwayland.enable = true;
        gamescope.enable = true;
        wireshark.enable = true;
        steam.enable = true;
      };
    };
}
