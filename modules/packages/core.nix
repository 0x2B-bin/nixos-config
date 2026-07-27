{ self, ... }:

{
  flake.nixosModules.core-packages =
    { pkgs, inputs, ... }:
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
        tokei
        bat
        file
        btop
        just
        unzip
        ripgrep
        tailscale
        samba
        #self.packages."${pkgs.stdenv.hostPlatform.system}".fhs
        gcc
        gnumake
        tree-sitter
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
