{ self, inputs, ... }:
{
  flake.nixosConfigurations.limbus = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs;
    };

    modules = with self.nixosModules; [
      limbus-configuration
      limbus-hardware
      inputs.home-manager.nixosModules.home-manager
      hm-desktop-config
      settings
    ];
  };
}
