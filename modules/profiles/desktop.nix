{ self, ... }:

{
  flake.nixosModules.desktop-profile = {
    imports = with self.nixosModules; [
      common-profile
      desktop-packages
      gaming-packages
      noctalia-greeter 
      plymouth
      pipewire
      security-packages
      grub
      fonts
      bluetooth
      xdg
      printing
      android
    ];

    programs.dconf.enable = true;
    hardware.opentabletdriver.enable = true;
  };
}
