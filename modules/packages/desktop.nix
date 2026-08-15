{
  flake.nixosModules.desktop-packages =
    { pkgs, inputs, ... }:
    {
        
      imports = [
        inputs.noctalia.nixosModules.default
      ];

      environment.systemPackages = with pkgs; [
        vesktop
        #aseprite; add back later, build error
        audacity
        nwg-look
        jellyfin-desktop
        element-desktop
        qFlipper
        networkmanagerapplet
        pavucontrol
        ffmpeg
        glib
        gsettings-desktop-schemas
        mpv
        wireshark
        postman
        obs-studio
        matugen
        wallust
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
        wpgtk
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
        wireshark.enable = true;
        noctalia = {
            enable = true;
            recommendedServices.enable = true;
        };
      };
    };
}
