{ self, inputs, ... }:

{
  flake.nixosConfigurations.eve = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs;
    };

    modules = with self.nixosModules; [
      eve-configuration
      eve-hardware
      inputs.home-manager.nixosModules.home-manager
      hm-server-config
      settings
    ];
  };
}
