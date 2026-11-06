{
  flake.nixosModules.security-packages =
    { pkgs, inputs, ... }:
    {
      environment.systemPackages = with pkgs; [
        hashcat
        john
        hydra
        ghidra-bin
        nmap
        gobuster
        ffuf
        aircrack-ng
        wirelesstools
        inputs.pwngdb.packages."${pkgs.stdenv.hostPlatform.system}".default
      ];
    };
}
