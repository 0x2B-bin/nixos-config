# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ self, ... }:
{
  flake.nixosModules.yorha-configuration = { config, pkgs, ... }: {
    imports = with self.nixosModules; [
      desktop-profile
      remote-builder
    ];

    services.remoteBuilder = {
      enable = true;
      sshIP = "0.0.0.0";
    };

    settings = {
      qylock-theme = "nier-automata";
      qylock-sddm-font = ../../../fonts/FOT-Rodin-Pro-DB.otf;
      shell = "nushell";
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.uinput.enable = true;
    users.users.${config.settings.username} = {
      extraGroups = [ "uinput" ];
    };

    services.udev.packages = with pkgs; [ game-devices-udev-rules ];

    boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.open = true;
    hardware.nvidia.modesetting.enable = true;

    networking.hostName = "yorha";

    system.stateVersion = "25.05";
  };
}
