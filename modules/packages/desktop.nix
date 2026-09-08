{
  flake.nixosModules.desktop-packages =
    { pkgs, inputs, ... }:
    {

      imports = [
        inputs.noctalia.nixosModules.default
      ];

      environment.systemPackages = with pkgs; [
        vesktop
        aseprite
        audacity
        nwg-look
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
        (xwayland-satellite.overrideAttrs (finalAttrs: previousAttrs: rec {
          version = "0.8.1";
          src = pkgs.fetchFromGitHub {
            owner = "Supreeeme";
            repo = "xwayland-satellite";
            tag = "v${finalAttrs.version}";
            hash = "sha256-BUE41HjLIGPjq3U8VXPjf8asH8GaMI7FYdgrIHKFMXA=";
          };
          cargoHash = "sha256-16L6gsvze+m7XCJlOA1lsPNELE3D364ef2FTdkh0rVY=";
          cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
            inherit src;
            hash = "sha256-16L6gsvze+m7XCJlOA1lsPNELE3D364ef2FTdkh0rVY=";
          };
        }))
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
        adwaita-icon-theme
        wl-mirror
        wl-clipboard
        kitty
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
