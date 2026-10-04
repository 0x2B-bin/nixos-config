{
  flake.nixosModules.android = { pkgs, config, ... }: {
    environment.systemPackages = with pkgs; [
      android-studio
      android-tools
    ];

    #virtualisation.kvm.enable = true;
    users.users.${config.settings.username}.extraGroups = [ "kvm" "adbusers" ];
  };
}
