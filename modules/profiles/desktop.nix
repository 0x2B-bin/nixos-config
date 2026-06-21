{ self, ... }:

{
  flake.nixosModules.desktop-profile = {
    imports = with self.nixosModules; [
      common-profile
      desktop-packages
      gaming-packages
      sddm
      plymouth
      pipewire
      security-packages
      grub
      fonts
      bluetooth
      xdg
    ];

    programs.dconf.enable = true;
  };
}
