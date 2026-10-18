{ self, ... }:
{
  flake.nixosModules.limbus-configuration = { inputs, pkgs, ... }: {
    imports = with self.nixosModules; [
      desktop-profile
      distributedBuilds
      binary-cache-client
    ];

    settings = {
      qylock-theme = "enfield";
      shell = "nushell";
      grub-theme = inputs.grub-themes.packages.${pkgs.stdenv.hostPlatform.system}.lobo;
    };

    hardware.graphics.enable = true;

    services.xserver.videoDrivers = [
      "amdgpu"
      "nvidia"
    ];

    hardware.nvidia = {
      open = true;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        nvidiaBusId = "PCI:195@0:0:0";
        amdgpuBusId = "PCI:194@0:0:0";
      };
    };

    services.libinput.enable = true;

    environment.etc."libinput/local-overrides.quirks".text = ''
      [Acer Swift PIXA4812 Touchpad]
      MatchBus=i2c
      MatchVendor=0x093A
      MatchProduct=0x4812
      MatchUdevType=touchpad
      AttrEventCode=-ABS_MT_PRESSURE;-ABS_PRESSURE
    '';

    boot.extraModprobeConfig = ''
      options hid_multitouch quirks=0x093A:0x4812:0x0004";
    '';

    networking.hostName = "limbus";

    system.stateVersion = "25.05";
  };
}
