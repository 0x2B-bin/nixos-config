{ self, ... }:
{
  flake.nixosModules.common-profile = {
    imports = with self.nixosModules; [
      core-packages
      openssh
      resolved
      tailscale
      flipper
      users
      network-manager
      nix-ld
      nix-settings
    ];

    time.timeZone = "America/New_York";

    environment.etc."gai.conf".text = ''
      precedence ::ffff:0:0/96 100
    '';
    networking.enableIPv6 = false;

    boot.kernel.sysctl = {
      "net.ipv6.conf.all.disable_ipv6" = 1;
      "net.ipv6.conf.default.disable_ipv6" = 1;
      "net.ipv6.conf.enp7s0.disable_ipv6" = 1;
    };
  };
}
