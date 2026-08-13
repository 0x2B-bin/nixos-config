{
  description = "My NixOS Configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    import-tree.url = "github:vic/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    noctalia.url = "github:noctalia-dev/noctalia";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    snapsr = {
      url = "github:0x2B-bin/snapsr";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    henshin = {
      url = "github:0x2B-bin/henshin";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    mikuPlymouth = {
      url = "github:Thang1191/MikuPlymouth";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pwngdb = {
      url = "github:pwndbg/pwndbg";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hatsune-miku-cursors = {
      url = "github:0x2B-bin/hatsune-miku-cursors-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    anicursors = {
      url = "github:0x2B-bin/AniCursors";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    grub-themes = {
      url = "git+https://codeberg.org/0x2B/grub-themes-nix.git";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    qylock = {
      url = "github:0x2B-bin/qylock-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    auc-flake = {
      url = "git+ssh://git@gitlab.com/animeuc/nixos-modules.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      flake-parts,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
