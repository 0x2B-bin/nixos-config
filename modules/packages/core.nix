{ self, ... }:

{
  flake.nixosModules.core-packages = { pkgs, inputs, ... }:
    {
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages = with pkgs; [
        vim
        bluez
        nh
        git
        zsh
        nushell
        wget
        neovim
        fastfetch
        eza
        bat
        file
        btop
        unzip
        tailscale
        samba
        #inputs.snapsr.packages."${pkgs.stdenv.hostPlatform.system}".default
        #self.packages."${pkgs.stdenv.hostPlatform.system}".fhs
        gcc
        (python3.withPackages (
          p: with p; [
            requests
            pwntools
          ]
        ))
        nixd
        tmux
        docker
      ];

      programs.zsh.enable = true;
      virtualisation.docker.enable = true;
    };
}
