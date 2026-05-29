{ self, ... }:

{
  flake.nixosModules.desktop-profile = {
    imports = with self.nixosModules; [
      common-profile
      desktop-packages
      sddm
      plymouth
      pipewire
      security-packages
      grub
      fonts
      bluetooth
    ];

    programs.dconf.enable = true;
  };
}
