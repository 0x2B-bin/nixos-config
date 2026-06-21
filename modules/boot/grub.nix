{ self, ... }:
{
  flake.nixosModules.grub =
    { pkgs, config, ... }:
    {
      config = {
        boot.loader.efi.canTouchEfiVariables = true;
        boot.loader.grub.enable = true;
        boot.loader.grub.device = "nodev";
        boot.loader.grub.efiSupport = true;
        boot.loader.grub.theme =
          self.packages.${pkgs.stdenv.hostPlatform.system}.${config.settings.grub-theme} + "/theme";
        boot.loader.grub.useOSProber = true;
      };
    };
}
