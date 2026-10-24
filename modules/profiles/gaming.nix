{ self, ... }:

{
  flake.nixosModules.gaming-profile = {
    imports = with self.nixosModules; [
      gaming-packages
    ];

    security.rtkit.enable = true;
    hardware.graphics.enable32Bit = true; 
    hardware.graphics.enable = true;
  };
}
