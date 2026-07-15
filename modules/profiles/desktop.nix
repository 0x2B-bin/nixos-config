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
      printing
    ];

    programs.dconf.enable = true;
    hardware.opentabletdriver.enable = true;
  };
}
