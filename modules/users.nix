{
  flake.nixosModules.users =
    {
      config,
      pkgs,
      ...
    }:
    {
      config = {
        users.users.${config.settings.username} = {
          isNormalUser = true;
          shell = pkgs.${config.settings.shell};
          extraGroups = [
            "wheel"
            "docker"
            "networkmanager"
            "wireshark"
            "input"
          ];
          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBVQPHrA8zT8GJsbr4mR4GEuOR3AqWmhWqfXz/3255ee nate@yorha"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDtjIIOjp73MKP19LRRoPk/0rKQCs9m47IDcHEEJfMwC nate@tailless"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGZ0XZLefOMuXEhP7ARlBo87sLRQ/4VmUu1EhyYO/sN7 nate@limbus"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG6YukiuhBXXI7iVl7jggE4LAnCOqmLK5LZj2v+dpUvk nate@oracle"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHk3KjRsklgVBpq/iWdf/QmJJS9zcEd+92HJ24fMPlHy nate@nazuna"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFQhkyRs1cU8k+RO67GIqP6xP8j8w/fb5IkXsXyuHWva nate@eve"
          ];
        };
      };
    };
}
